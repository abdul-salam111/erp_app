import 'package:flutter/material.dart';
import 'package:flutter_template/core/theme/theme_utils.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      title: Text(
        title,
        style: context.bodyLarge.copyWith(
          color: context.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: context.primary,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
