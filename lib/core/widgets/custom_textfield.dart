import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../theme/theme_utils.dart';
import '../utils/utils_exports.dart';


class CustomTextFormField extends StatefulWidget {
  final String? hintText;
  final String? label;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final int maxLines;
  final Color? fillColor;
  final Color? borderColor;
  final Color? labelColor;
  final bool isRequired;
  final bool boldLabel;
  final int labelFontSize;
  final bool readOnly;
  final double? fieldHeight;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;

  const CustomTextFormField({
    super.key,
    this.hintText,
    this.label,
    this.readOnly = false,
    this.prefixIcon,
    this.isRequired = false,
    this.boldLabel = false,
    this.fillColor,
    this.borderColor,
    this.controller,
    this.labelColor,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.labelFontSize = 16,
    this.onChanged,
    this.onTap,
    this.maxLines = 1,
    this.fieldHeight = 56,
    this.contentPadding,
    this.hintStyle,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscure;

  @override
  void initState() {
    super.initState();
    isObscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    // Default colors based on theme
    final defaultFillColor = widget.fillColor ?? context.surface;
    final defaultBorderColor = widget.borderColor ?? context.border;
    final defaultLabelColor = widget.labelColor ?? context.textSecondary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with optional required asterisk
        if (widget.label != null)
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: widget.label!,
                  style: context.bodySmall.copyWith(
                    color: defaultLabelColor,
                    fontSize: widget.labelFontSize.toDouble(),
                    fontWeight: widget.boldLabel ? .w600 : null,
                  ),
                ),
                if (widget.isRequired)
                  TextSpan(
                    text: " *",
                    style: context.bodyMedium.copyWith(
                      color: context.error,
                      fontWeight: FontWeight.bold,
                      fontSize: widget.labelFontSize.toDouble(),
                    ),
                  ),
              ],
            ),
          ),

        if (widget.label != null) heightBox(5),

        // Text Form Field
        SizedBox(
          height: widget.fieldHeight,
          child: TextFormField(
          
          autofocus: false,
          textCapitalization: TextCapitalization.words,
          readOnly: widget.readOnly,
          style: context.bodySmall.copyWith(color: context.textPrimary),
          controller: widget.controller,
          obscureText: isObscure,
          keyboardType: widget.keyboardType,
          maxLines: widget.obscureText ? 1 : widget.maxLines,
          decoration: InputDecoration(
            
            hintText: widget.hintText,
            hintStyle: widget.hintStyle ?? context.bodySmall.copyWith(color: context.textSecondary),
            prefixIcon: widget.prefixIcon != null
                ? Icon(widget.prefixIcon, color: context.grey500, size: 20)
                : null,
            fillColor: defaultFillColor,
            filled: true,
            contentPadding: widget.contentPadding ?? const EdgeInsets.only(left: 10),

            // Default border
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: defaultBorderColor),
            ),

            // Enabled border
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: defaultBorderColor),
            ),

            // Focused border
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.primary, width: 2),
            ),

            // Error border
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.error, width: 1),
            ),

            // Focused error border
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: context.error, width: 2),
            ),

            // Suffix icon for password visibility toggle
            suffixIcon: widget.obscureText
                ? IconButton(
                    icon: Icon(
                      isObscure ? Iconsax.eye_slash : Iconsax.eye,
                      color: context.grey500,
                      size: 20,
                    ),
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                  )
                : null,
          ),
          validator: widget.validator,
          onChanged: widget.onChanged,
          onTap: widget.onTap,
        ),
        ),
      ],
    );
  }
}
