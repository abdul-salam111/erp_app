import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/debug/cubit/api_debug_cubit.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/utils/utils_exports.dart';
import '../../../../../core/widgets/widgets.dart';
import '../../../../../routes/route_names.dart';
import '../../../auth_exports.dart';

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
          backgroundColor: const Color(0xFFF0F4FF),
          body: BlocConsumer<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state.apiStatus == ApiStatus.SUCCESS) {
                final user = state.user!;
                if (user.isAdmin) {
                  final orgs = user.organizations;
                  if (orgs.length <= 1) {
                    context.goNamed(RouteNames.dashboard);
                  } else {
                    context.goNamed(RouteNames.organizationSelection);
                  }
                } else {
                  if (user.roles.length > 1) {
                    context.goNamed(RouteNames.choose_dashboard);
                  } else {
                    context.goNamed(RouteNames.employee_dashboard);
                  }
                }
              }
              if (state.apiStatus == ApiStatus.FAILURE) {
                AppToastsUtils.showErrorTop(context, state.message.toString());
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  const _BackgroundDecoration(),
                  SafeArea(
                    child: Center(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(
                          horizontal: Responsive.value<double>(
                            context,
                            phone: 20,
                            tablet: 64,
                            ipad: 120,
                          ),
                          vertical: 24,
                        ),
                        child: _LoginCard(formKey: _formKey, state: state),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class _BackgroundDecoration extends StatelessWidget {
  const _BackgroundDecoration();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox.expand(
      child: Stack(
        children: [
          // Large blurred circle — top left
          Positioned(
            top: -size.height * 0.12,
            left: -size.width * 0.2,
            child: _Circle(
              diameter: size.width * 0.75,
              color: const Color(0xff1B84FF).withValues(alpha: 0.12),
            ),
          ),
          // Medium circle — bottom right
          Positioned(
            bottom: -size.height * 0.08,
            right: -size.width * 0.15,
            child: _Circle(
              diameter: size.width * 0.6,
              color: const Color(0xFF074DBF).withValues(alpha: 0.09),
            ),
          ),
          // Small accent — top right
          Positioned(
            top: size.height * 0.08,
            right: -size.width * 0.06,
            child: _Circle(
              diameter: size.width * 0.28,
              color: const Color(0xff1B84FF).withValues(alpha: 0.07),
            ),
          ),
        ],
      ),
    );
  }
}

class _Circle extends StatelessWidget {
  const _Circle({required this.diameter, required this.color});
  final double diameter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(shape: .circle, color: color),
    );
  }
}

class _LoginCard extends StatefulWidget {
  const _LoginCard({required this.formKey, required this.state});

  final GlobalKey<FormState> formKey;
  final SignInState state;

  @override
  State<_LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<_LoginCard> {
  int _debugTapCount = 0;
  DateTime? _firstDebugTap;

  void _onTitleTap() {
    final now = DateTime.now();
    if (_firstDebugTap == null || now.difference(_firstDebugTap!) > const Duration(seconds: 3)) {
      _firstDebugTap = now;
      _debugTapCount = 1;
    } else {
      _debugTapCount++;
    }
    if (_debugTapCount >= 5) {
      _debugTapCount = 0;
      _firstDebugTap = null;
      context.read<ApiDebugCubit>().toggleEnabled();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('API Debugger toggled')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(
        Responsive.value<double>(context, phone: 24, tablet: 32, ipad: 40),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: const Color(0xff1B84FF).withValues(alpha: 0.08),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Form(
        key: widget.formKey,
        child: Column(
          crossAxisAlignment: .center,
          mainAxisSize: .min,
          children: [
            // Logo badge — tap 5× to switch environment
            EnvSwitchDetector(
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: const Color(0xFFF0F4FF),
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.all(10),
                child: Image.asset(AppImages.manticLogo, fit: .contain),
              ),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: _onTitleTap,
              child: const Text(
                'Mantic ERP',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0D1B3E),
                  letterSpacing: -0.5,
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Sign in to your account',
              style: TextStyle(
                fontSize: 13,
                color: Color(0xFF717171),
              ),
            ),
            const SizedBox(height: 28),
            // Thin divider line
            Row(
              children: [
                Expanded(
                  child: Container(height: 1, color: const Color(0xFFEDEDED)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      shape: .circle,
                      color: Color(0xff1B84FF),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(height: 1, color: const Color(0xFFEDEDED)),
                ),
              ],
            ),
            const SizedBox(height: 24),
            BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (p, n) => p.email != n.email,
              builder: (context, state) {
                return CustomTextFormField(
                  prefixIcon: Iconsax.sms,
                  label: AppConstants.emailLabel,
                  keyboardType: TextInputType.emailAddress,
                  hintText: AppConstants.enterYourEmailHint,
                  validator: Validator.validateEmail,
                  onChanged: (email) {
                    context.read<SignInBloc>().add(EmailChangedEvent(email));
                  },
                );
              },
            ),
            const SizedBox(height: 14),
            BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (p, n) => p.password != n.password,
              builder: (context, state) {
                return CustomTextFormField(
                  onChanged: (password) {
                    context.read<SignInBloc>().add(PasswordChangedEvent(password));
                  },
                  obscureText: true,
                  prefixIcon: Iconsax.lock,
                  label: AppConstants.passwordLabel,
                  hintText: AppConstants.enterYourPasswordHint,
                  keyboardType: TextInputType.visiblePassword,
                  validator: Validator.validatePassword,
                );
              },
            ),
            const SizedBox(height: 28),
            BlocBuilder<SignInBloc, SignInState>(
              buildWhen: (p, n) => p.apiStatus != n.apiStatus,
              builder: (context, state) {
                return CustomButton(
                  isLoading: state.apiStatus == ApiStatus.LOADING,
                  text: AppConstants.signInBtn,
                  onPressed: () {
                    if (widget.formKey.currentState!.validate()) {
                      context.read<SignInBloc>().add(SignInSubmitted());
                    }
                  },
                  radius: 12,
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Powered by Mantic Solutions',
              style: TextStyle(
                fontSize: 11,
                color: const Color(0xFFACACAC),
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
