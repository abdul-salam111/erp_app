import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../auth_exports.dart';
import 'package:mantic_erp_app/core/constants/app_conts.dart';


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
          appBar: AppBar(title: const Text(AppConstants.signInTitle)),
          body: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state.apiStatus == ApiStatus.SUCCESS) {
                AppToastsUtils.showSuccessTop(
                  context,
                  AppConstants.youHaveLoggedinSuccessfully,
                );
              }

              if (state.apiStatus == ApiStatus.FAILURE) {
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
                            label: AppConstants.emailLabel,
                            keyboardType: TextInputType.emailAddress,
                            hintText: AppConstants.enterYourEmailHint,
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
                            label: AppConstants.passwordLabel,
                            hintText: AppConstants.enterYourPasswordHint,
                            keyboardType: TextInputType.visiblePassword,
                          );
                        },
                      ),
                      heightBox(context.screenHeight * 0.05),
                      BlocBuilder<SignInBloc, SignInState>(
                        buildWhen: (p, n) => p.apiStatus != n.apiStatus,
                        builder: (context, state) {
                          return CustomButton(
                            isLoading: state.apiStatus == ApiStatus.LOADING,
                            text: AppConstants.signInBtn,
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
