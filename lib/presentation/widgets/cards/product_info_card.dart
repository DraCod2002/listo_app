import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class ProductInfoCard extends StatelessWidget {
  final String name;
  final String description;
  final double price;

  const ProductInfoCard({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(AppSizes.paddingL),
      padding: const EdgeInsets.all(AppSizes.paddingL),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusL),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, AppSizes.elevationLow),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSizes.spaceS),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.textSecondary,
              height: 1.4,
            ),
          ),
          const SizedBox(height: AppSizes.spaceM),
          Text(
            'S/${price.toStringAsFixed(2)}',
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}