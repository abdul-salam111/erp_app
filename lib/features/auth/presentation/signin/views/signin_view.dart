import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../../core/debug/cubit/api_debug_cubit.dart';
import '../../../../../core/di/di_exports.dart';
import '../../../../../core/constants/const_exports.dart';
import '../../../../../core/services/session_manager.dart';
import '../../../../../core/theme/colors.dart';
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
          backgroundColor: AppColors.loginBackground,
          body: BlocListener<SignInBloc, SignInState>(
            listener: (context, state) {
              if (state.apiStatus == ApiStatus.SUCCESS) {
                if (state.message != null) {
                  AppToastsUtils.showErrorTop(
                    context,
                    'Roles check failed: ${state.message}',
                  );
                }
                final user = state.user!;
                if (user.organizations.length > 1) {
                  // Multi-org: role is unknown until org is selected and
                  // SelectBranch + GetUserRoles complete in BranchSelectionBloc.
                  context.goNamed(RouteNames.organizationSelection);
                } else {
                  final roles = SessionController.instance.userRoles;
                  final isAdmin = roles.any(
                    (r) => AppConstants.adminRoles
                        .contains(r.toLowerCase().trim()),
                  );
                  if (isAdmin) {
                    context.goNamed(RouteNames.dashboard);
                  } else if (roles.length <= 1) {
                    context.goNamed(RouteNames.dashboard);
                  } else {
                    context.goNamed(RouteNames.choose_dashboard);
                  }
                }
              }
              if (state.apiStatus == ApiStatus.FAILURE) {
                AppToastsUtils.showErrorTop(context, state.message.toString());
              }
            },
            child: Stack(
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
                      child: _LoginCard(formKey: _formKey),
                    ),
                  ),
                ),
              ],
            ),
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
          Positioned(
            top: -size.height * 0.12,
            left: -size.width * 0.2,
            child: _Circle(
              diameter: size.width * 0.75,
              color: AppColors.primary.withValues(alpha: 0.12),
            ),
          ),
          Positioned(
            bottom: -size.height * 0.08,
            right: -size.width * 0.15,
            child: _Circle(
              diameter: size.width * 0.6,
              color: AppColors.primaryDark.withValues(alpha: 0.09),
            ),
          ),
          Positioned(
            top: size.height * 0.08,
            right: -size.width * 0.06,
            child: _Circle(
              diameter: size.width * 0.28,
              color: AppColors.primary.withValues(alpha: 0.07),
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
  const _LoginCard({required this.formKey});

  final GlobalKey<FormState> formKey;

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
        color: AppColors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.08),
            blurRadius: 40,
            offset: const Offset(0, 12),
          ),
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.04),
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
            EnvSwitchDetector(
              child: Container(
                width: 72,
                height: 72,
                decoration: BoxDecoration(
                  color: AppColors.loginBackground,
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
                  color: AppColors.navyDark,
                  letterSpacing: -0.5,
                ),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Sign in to your account',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.grey500,
              ),
            ),
            const SizedBox(height: 28),
            Row(
              children: [
                Expanded(
                  child: Container(height: 1, color: AppColors.grey200),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      shape: .circle,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(height: 1, color: AppColors.grey200),
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
            const Text(
              'Powered by Mantic Solutions',
              style: TextStyle(
                fontSize: 11,
                color: AppColors.grey300,
                letterSpacing: 0.3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
