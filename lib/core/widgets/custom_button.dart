import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';
import 'loading_indicator.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final double radius;
  final double padding;
  final double elevation;
  final IconData? icon;
  final double iconSize;
  final Color iconColor;
  final bool isLoading;
  final int fontsize;
  final Size size;
  final bool isOutlined;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.textColor = AppColors.white,
    this.radius = 50.0,
    this.padding = 0.0,
    this.fontsize = 16,
    this.elevation = 4.0,
    this.icon,
    this.iconSize = 24.0,
    this.iconColor = AppColors.white,
    this.isLoading = false,
    this.size = const Size(double.infinity, 50),
    this.isOutlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final child = isLoading
        ? LoadingIndicator(size: 30)
        : Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (icon != null) Icon(icon, size: iconSize, color: isOutlined ? backgroundColor : iconColor),
              if (icon != null) SizedBox(width: 8),
              Text(
                text,
                style: GoogleFonts.roboto(
                  color: isOutlined ? backgroundColor : textColor,
                  fontSize: fontsize.toDouble(),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );

    if (isOutlined) {
      return OutlinedButton(
        onPressed: isLoading ? null : onPressed,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: backgroundColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          padding: EdgeInsets.all(padding),
          minimumSize: size,
        ),
        child: child,
      );
    }

    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: AppColors.transparent,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: EdgeInsets.all(padding),
        elevation: elevation,
        minimumSize: size,
      ),
      child: child,
    );
  }
}
