import 'package:flutter/material.dart';
import 'package:flutter_template/core/theme/colors.dart';
import 'package:google_fonts/google_fonts.dart';
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

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = AppColors.primary,
    this.textColor = Colors.white,
    this.radius = 50.0,
    this.padding = 0.0,
    this.fontsize = 16,
    this.elevation = 4.0,
    this.icon,
    this.iconSize = 24.0,
    this.iconColor = Colors.white,
    this.isLoading = false,
    this.size = const Size(double.infinity, 50),
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        shadowColor: Colors.transparent,
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        padding: EdgeInsets.all(padding),
        elevation: elevation,
        minimumSize: size,
      ),
      child: isLoading
          ? LoadingIndicator(size: 30)
          : Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) Icon(icon, size: iconSize, color: iconColor),
                if (icon != null) SizedBox(width: 8),
                Text(
                  text,
                  style: GoogleFonts.roboto(
                    color: textColor,
                    fontSize: fontsize.toDouble(),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
    );
  }
}
