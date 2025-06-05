import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String price;
  final String? imagePath;
  final String? discount;
  final VoidCallback? onTap;

  const ProductCard({
    super.key,
    required this.name,
    required this.price,
    this.imagePath,
    this.discount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppSizes.radiusM),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey300.withOpacity(0.3),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del producto
            Stack(
              children: [
                Container(
                  height: 100,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFDFD),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(AppSizes.radiusM),
                      topRight: Radius.circular(AppSizes.radiusM),
                    ),
                  ),
                  child: imagePath != null
                      ? ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(AppSizes.radiusM),
                            topRight: Radius.circular(AppSizes.radiusM),
                          ),
                          child: Image.asset(
                            imagePath!,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.fastfood,
                          size: AppSizes.iconXL,
                          color: AppColors.grey400,
                        ),
                ),

                // Badge de descuento
                if (discount != null)
                  Positioned(
                    top: AppSizes.paddingS,
                    right: AppSizes.paddingS,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.paddingS,
                        vertical: AppSizes.paddingXS,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.discountBadge,
                        borderRadius: BorderRadius.circular(AppSizes.radiusXS),
                      ),
                      child: Text(
                        discount!,
                        style: Theme.of(context).textTheme.labelSmall?.copyWith(
                              color: AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),

                
              ],
            ),

            // Información del producto
            Padding(
              padding: const EdgeInsets.all(AppSizes.paddingS),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: AppSizes.spaceXS),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 14
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
