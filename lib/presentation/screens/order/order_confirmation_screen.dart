import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../widgets/cards/estimated_time_card.dart';
import '../../widgets/cards/order_confirmation_card.dart';
import '../../widgets/cards/pickud_location_card.dart';
import '../../widgets/forms/custom_appbar.dart';
import '../../widgets/forms/custom_button.dart';

class OrderConfirmationScreen extends StatelessWidget {
  final String? orderId;
  final List<OrderItem>? orderItems;
  final double? totalAmount;
  final String? pickupLocation;
  final String? estimatedTime;

  const OrderConfirmationScreen({
    Key? key,
    this.orderId,
    this.orderItems,
    this.totalAmount,
    this.pickupLocation,
    this.estimatedTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Datos por defecto si no se pasan parámetros
    final displayOrderId = orderId ?? '12345';
    final displayOrderItems = orderItems ?? _getDefaultOrderItems();
    final displayTotalAmount = totalAmount ?? 21.00;
    final displayPickupLocation = pickupLocation ?? 'Patio Panorama';
    final displayEstimatedTime = estimatedTime ?? '11:40';

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: AppSizes.spaceXL),
            // Header
            _buildHeader(displayOrderId),

            const SizedBox(height: AppSizes.spaceS),

            // Order summary card
            OrderConfirmationCard(
              orderItems: displayOrderItems,
              totalAmount: displayTotalAmount,
            ),

            const SizedBox(height: AppSizes.spaceL),

            // Pickup location
            PickupLocationCard(location: displayPickupLocation),

            const SizedBox(height: AppSizes.spaceL),

            // Estimated time
            EstimatedTimeWidget(time: displayEstimatedTime),

            const SizedBox(height: AppSizes.spaceXXL),

            // Action buttons
            _buildActionButtons(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(String displayOrderId) {
    return Column(
      children: [
        // Logo
        Image.asset(
          'assets/images/listo_logo.png',
          height: 50,
        ),

        const SizedBox(height: AppSizes.spaceL),

        // Thank you message
        const Text(
          '¡Gracias por tu compra!',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimary,
          ),
        ),

        const SizedBox(height: AppSizes.spaceS),

        // Order ID
        Text(
          'Pedido #$displayOrderId',
          style: const TextStyle(
            fontSize: 18,
            color: AppColors.primary,
            fontWeight: FontWeight.w500,
          ),
        ),

        const SizedBox(height: AppSizes.spaceXS),

        // Order status
        const Text(
          'Pedido en proceso',
          style: TextStyle(
            fontSize: 18,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  // Datos por defecto para pruebas/demo
  List<OrderItem> _getDefaultOrderItems() {
    return [
      OrderItem(
        name: 'Triple',
        quantity: 1,
        price: 12.00,
        subtotal: 12.00,
      ),
      OrderItem(
        name: 'Latte',
        quantity: 1,
        price: 9.00,
        subtotal: 9.00,
      ),
    ];
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        // Contact support button
        CustomButton(
          text: 'Contactar con soporte',
          onPressed: () {
            // TODO: Implement contact support
          },
          backgroundColor: AppColors.surface,
          textColor: AppColors.primary,
          borderColor: AppColors.primary,
        ),

        const SizedBox(height: AppSizes.spaceM),

        // Back to store button
        CustomButton(
          text: 'Volver a la tienda',
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          backgroundColor: AppColors.primary,
          textColor: AppColors.white,
        ),
      ],
    );
  }
}

// Model for order items
class OrderItem {
  final String name;
  final int quantity;
  final double price;
  final double subtotal;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
    required this.subtotal,
  });
}
