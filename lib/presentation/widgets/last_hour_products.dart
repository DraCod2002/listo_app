// lib/presentation/screens/cart/widgets/last_hour_products.dart
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../data/models/LastHourProduct.dart';

class LastHourProducts extends StatelessWidget {
  final List<LastHourProduct> products = [
    LastHourProduct(
      id: '1',
      name: 'Fresa alisto',
      price: 6.50,
      image: '🥤',
      backgroundColor: Color(0xFFFFE5E5),
    ),
    LastHourProduct(
      id: '2',
      name: 'Moscato',
      price: 30.00,
      image: '🍾',
      backgroundColor: Color(0xFFE5D4C1),
    ),
    LastHourProduct(
      id: '3',
      name: 'Focaccia',
      price: 12.00,
      image: '🍕',
      backgroundColor: Color(0xFFE5F2E5),
    ),
    LastHourProduct(
      id: '4',
      name: 'Té helado',
      price: 8.00,
      image: '🧊',
      backgroundColor: Color(0xFFE5F5FF),
    ),
  ];

  LastHourProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
          child: Row(
            children: [
              const Text(
                'Última hora',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimary,
                ),
              ),
             const SizedBox(width: AppSizes.spaceS),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSizes.paddingS,
                  vertical: 2,
                ),
                decoration: BoxDecoration(
                  color: AppColors.warning,
                  borderRadius: BorderRadius.circular(AppSizes.radiusS),
                ),
                child: const Text(
                  'OFERTA',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
       const SizedBox(height: AppSizes.spaceM),
        Container(
          height: 140,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return _buildProductCard(product, context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildProductCard(LastHourProduct product, BuildContext context) {
    return GestureDetector(
      onTap: () => _onProductTap(product, context),
      child: Container(
        width: 100,
        margin: EdgeInsets.only(right: AppSizes.spaceM),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: product.backgroundColor,
                borderRadius: BorderRadius.circular(AppSizes.radiusM),
                border: Border.all(
                  color: AppColors.grey200,
                  width: 0.5,
                ),
              ),
              child: Center(
                child: Text(
                  product.image,
                  style: TextStyle(fontSize: 32),
                ),
              ),
            ),
           const SizedBox(height: AppSizes.spaceS),
            Text(
              product.name,
              style:const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.textPrimary,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: AppSizes.spaceXS),
            Text(
              'S/ ${product.price.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 12,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onProductTap(LastHourProduct product, BuildContext context) {
    // Mostrar un diálogo o agregar al carrito
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(product.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: product.backgroundColor,
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
                child: Center(
                  child: Text(product.image, style: TextStyle(fontSize: 24)),
                ),
              ),
              SizedBox(height: AppSizes.spaceM),
              Text(
                'S/ ${product.price.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              SizedBox(height: AppSizes.spaceM),
              const Text(
                '¿Deseas agregar este producto al carrito?',
                textAlign: TextAlign.center,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'Cancelar',
                style: TextStyle(color: AppColors.textSecondary),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product.name} agregado al carrito'),
                    backgroundColor: AppColors.success,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusS),
                ),
              ),
              child:const Text(
                'Agregar',
                style: TextStyle(color: AppColors.white),
              ),
            ),
          ],
        );
      },
    );
  }
}

