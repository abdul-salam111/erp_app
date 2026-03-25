import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import '../../../../../app_exports.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SignInBloc>(),
      child: UnfocusWrapper(
        child: Scaffold(
          appBar: AppBar(title: const Text('Sign In')),
          body: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state.apiStatus == ApiStatus.success) {
                AppToastsUtils.showSuccessTop(
                  context,
                  "You have loggedin successfully!",
                );
              }

              if (state.apiStatus == ApiStatus.failure) {
                AppToastsUtils.showErrorTop(context, state.message.toString());
              }
            },
            builder: (context, state) {
              return Center(
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      const AppLogo(),
                      heightBox(context.screenHeight * 0.1),
                      BlocBuilder<SignInBloc, SignInState>(
                        buildWhen: (p, n) => p.email != n.email,
                        builder: (context, state) {
                          return CustomTextFormField(
                            prefixIcon: Iconsax.sms,
                            label: "Email",
                            keyboardType: TextInputType.emailAddress,
                            hintText: "Enter your email",
                            onChanged: (email) {
                              context.read<SignInBloc>().add(
                                EmailChangedEvent(email),
                              );
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 16),
                      BlocBuilder<SignInBloc, SignInState>(
                        buildWhen: (p, n) => p.password != n.password,
                        builder: (context, state) {
                          return CustomTextFormField(
                            onChanged: (password) {
                              context.read<SignInBloc>().add(
                                PasswordChangedEvent(password),
                              );
                            },
                            obscureText: true,
                            prefixIcon: Iconsax.lock,
                            label: 'Password',
                            hintText: "Enter your password",
                            keyboardType: TextInputType.visiblePassword,
                          );
                        },
                      ),
                      heightBox(context.screenHeight * 0.05),
                      BlocBuilder<SignInBloc, SignInState>(
                        buildWhen: (p, n) => p.apiStatus != n.apiStatus,
                        builder: (context, state) {
                          return CustomButton(
                            isLoading: state.apiStatus == ApiStatus.loading,
                            text: "SignIn",
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.read<SignInBloc>().add(
                                  SignInSubmitted(),
                                );
                              }
                            },
                            radius: 10,
                          );
                        },
                      ),
                    ],
                  ),
                ).paddingAll(12),
              );
            },
          ),
        ),
      ),
    );
  }
}
