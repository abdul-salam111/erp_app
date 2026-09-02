import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/constants/app_images.dart';
import '../../core/di/app_dependencies.dart';
import '../../core/services/services_exports.dart';
import '../../core/theme/theme_exports.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 600), () {
      if (mounted) sl<SplashServices>().isLoggedIn(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        children: [
          // ── Gradient background ──────────────────────────────
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [AppColors.midnightBlue, AppColors.primaryDark, AppColors.primary],
                stops: [0.0, 0.55, 1.0],
              ),
            ),
          ),

          // ── Decorative blurred circles ───────────────────────
          Positioned(
            top: -size.height * 0.1,
            right: -size.width * 0.2,
            child: _GlowCircle(diameter: size.width * 0.7, opacity: 0.12),
          ).animate().fadeIn(delay: 0.ms, duration: 300.ms),

          Positioned(
            bottom: -size.height * 0.12,
            left: -size.width * 0.25,
            child: _GlowCircle(diameter: size.width * 0.8, opacity: 0.10),
          ).animate().fadeIn(delay: 50.ms, duration: 300.ms),

          Positioned(
            top: size.height * 0.35,
            left: -size.width * 0.1,
            child: _GlowCircle(diameter: size.width * 0.35, opacity: 0.07),
          ).animate().fadeIn(delay: 100.ms, duration: 300.ms),

          // ── Center content ───────────────────────────────────
          Center(
            child: Column(
              mainAxisSize: .min,
              children: [
                // Logo ring + logo
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    shape: .circle,
                    color: context.white.withValues(alpha: 0.08),
                    border: Border.all(
                      color: context.white.withValues(alpha: 0.18),
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: .circle,
                        color: context.white,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.5),
                            blurRadius: 32,
                            spreadRadius: 4,
                          ),
                        ],
                      ),
                      padding: const .all(16),
                      child: Image.asset(AppImages.manticLogo, fit: .contain),
                    ),
                  ),
                )
                    .animate()
                    .scale(
                      begin: const Offset(1.8, 1.8),
                      end: const Offset(1.0, 1.0),
                      delay: 0.ms,
                      duration: 400.ms,
                      curve: Curves.easeOutCubic,
                    )
                    .fadeIn(delay: 0.ms, duration: 200.ms),

                const SizedBox(height: 32),

                // App name
                Text(
                  'Mantic ERP',
                  style: context.headlineLarge.copyWith(
                    color: context.white,
                    fontWeight: .w800,
                    letterSpacing: 1.2,
                  ),
                )
                    .animate()
                    .slideY(
                      begin: 0.4,
                      end: 0,
                      delay: 200.ms,
                      duration: 280.ms,
                      curve: Curves.easeOut,
                    )
                    .fadeIn(delay: 200.ms, duration: 280.ms),

                const SizedBox(height: 8),

                // Tagline
                Text(
                  'Enterprise Resource Planning',
                  style: context.bodyMedium.copyWith(
                    color: context.white.withValues(alpha: 0.60),
                    letterSpacing: 2.5,
                  ),
                )
                    .animate()
                    .fadeIn(delay: 350.ms, duration: 200.ms),
              ],
            ),
          ),

          // ── Bottom loader ────────────────────────────────────
          Positioned(
            bottom: 52,
            left: 0,
            right: 0,
            child: Column(
              children: [
                _PulsingDots(),
                const SizedBox(height: 16),
                Text(
                  'Powered by Mantic Solutions',
                  textAlign: .center,
                  style: context.labelSmall.copyWith(
                    color: context.white.withValues(alpha: 0.30),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(delay: 400.ms, duration: 200.ms),
        ],
      ),
    );
  }
}

class _GlowCircle extends StatelessWidget {
  const _GlowCircle({required this.diameter, required this.opacity});
  final double diameter;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: diameter,
      height: diameter,
      decoration: BoxDecoration(
        shape: .circle,
        color: context.white.withValues(alpha: opacity),
      ),
    );
  }
}

class _PulsingDots extends StatefulWidget {
  @override
  State<_PulsingDots> createState() => _PulsingDotsState();
}

class _PulsingDotsState extends State<_PulsingDots>
    with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: .min,
      children: List.generate(3, (i) {
        return AnimatedBuilder(
          animation: _ctrl,
          builder: (_, __) {
            final offset = (i / 3);
            final t = ((_ctrl.value - offset) % 1.0).clamp(0.0, 1.0);
            final scale = 0.6 + 0.4 * (t < 0.5 ? t * 2 : (1 - t) * 2);
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              width: 7 * scale,
              height: 7 * scale,
              decoration: BoxDecoration(
                shape: .circle,
                color: context.white.withValues(alpha: 0.5 + 0.5 * scale),
              ),
            );
          },
        );
      }),
    );
  }
}
