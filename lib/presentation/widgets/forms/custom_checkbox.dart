import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class CustomCheckbox extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool?> onChanged;
  final EdgeInsetsGeometry? padding;

  const CustomCheckbox({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: AppSizes.paddingS),
      child: Row(
        children: [
          SizedBox(
            width: AppSizes.checkboxSize,
            height: AppSizes.checkboxSize,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppSizes.radiusXS),
              ),
            ),
          ),
          const SizedBox(width: AppSizes.spaceM),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textPrimary,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}