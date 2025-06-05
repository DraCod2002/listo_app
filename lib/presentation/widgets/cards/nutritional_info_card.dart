import 'package:flutter/material.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class NutritionalInfoCard extends StatelessWidget {
  final int calories;
  final int carbs;
  final int protein;

  const NutritionalInfoCard({
    Key? key,
    required this.calories,
    required this.carbs,
    required this.protein,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
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
          Row(
            children: const [
              Text(
                'Información nutricional',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(width: AppSizes.spaceS),
              Icon(
                Icons.info_outline,
                size: AppSizes.iconS,
                color: AppColors.grey400,
              ),
            ],
          ),
          const SizedBox(height: AppSizes.spaceM),
          Row(
            children: [
              Expanded(
                child: _buildNutritionalItem(
                  '$calories kcal',
                  'Calorías',
                ),
              ),
              Expanded(
                child: _buildNutritionalItem(
                  '${carbs}g',
                  'Carb',
                ),
              ),
              Expanded(
                child: _buildNutritionalItem(
                  '${protein}g',
                  'Proteína',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNutritionalItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: AppSizes.spaceXS),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}