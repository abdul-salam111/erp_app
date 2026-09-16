import 'dart:ui';

import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../theme/theme_utils.dart';

class GlassSurface extends StatelessWidget {
  final Widget child;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final Clip clipBehavior;

  const GlassSurface({
    super.key,
    required this.child,
    this.radius = 16,
    this.padding,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    final body = padding != null ? Padding(padding: padding!, child: child) : child;
    return context.isDark ? _glass(body) : _solid(context, body);
  }

  Widget _glass(Widget body) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
        child: Container(
          clipBehavior: clipBehavior,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.white.withValues(alpha: 0.06),
                AppColors.white.withValues(alpha: 0.02),
              ],
            ),
            border: Border.all(
              color: AppColors.white.withValues(alpha: 0.10),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.black.withValues(alpha: 0.08),
                blurRadius: 14,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: body,
        ),
      ),
    );
  }

  Widget _solid(BuildContext context, Widget body) {
    return Container(
      clipBehavior: clipBehavior,
      decoration: BoxDecoration(
        color: context.surfaceElevated,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: context.border),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.06),
            blurRadius: 14,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: body,
    );
  }
}
