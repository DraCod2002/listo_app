import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class OrderSummaryCard extends StatelessWidget {
  final double subtotal;
  final double taxes;
  final double total;
  final String deliveryTime;

  const OrderSummaryCard({
    Key? key,
    required this.subtotal,
    required this.taxes,
    required this.total,
    required this.deliveryTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
      padding:const EdgeInsets.all(AppSizes.paddingM),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 8,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Text(
            'Resumen del pedido',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
         const SizedBox(height: AppSizes.spaceM),
          _buildSummaryRow(
            'Subtotal',
            'S/ ${subtotal.toStringAsFixed(2)}',
          ),
         const SizedBox(height: AppSizes.spaceS),
          _buildSummaryRow(
            'Tiempo de espera',
            deliveryTime,
          ),
          const SizedBox(height: AppSizes.spaceS),
          _buildSummaryRow(
            'Impuestos',
            'S/ ${taxes.toStringAsFixed(2)}',

          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: AppSizes.spaceM),
            child: Divider(
              color: AppColors.divider,
              thickness: 1,
            ),
          ),
          _buildSummaryRow(
            'Total',
            'S/ ${total.toStringAsFixed(2)}',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(
    String label,
    String value, {
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 20 : 16,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            color: isTotal ? AppColors.textPrimary : AppColors.textSecondary,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 20 : 16,
            fontWeight: FontWeight.bold,
            color: isTotal ? AppColors.primary : AppColors.textPrimary,
          ),
        ),
      ],
    );
  }
}