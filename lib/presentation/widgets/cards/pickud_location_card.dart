import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class PickupLocationCard extends StatelessWidget {
  final String location;

  const PickupLocationCard({
    Key? key,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSizes.paddingL),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Lugar de recogida',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          
          const SizedBox(height: AppSizes.spaceS),
          
          Text(
            location,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}