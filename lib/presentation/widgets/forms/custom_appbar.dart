import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.actions,
    this.backgroundColor,
    this.textColor,
    this.onBackPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColors.surface,
      elevation: 0,
      centerTitle: true,
      leading: showBackButton
        ? IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.textPrimary,
              size: AppSizes.iconM,
            ),
            onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
          )
        : null,
      title: title.isNotEmpty
        ? Text(
            title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: textColor ?? AppColors.textPrimary,
            ),
          )
        : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSizes.appBarHeight);
}