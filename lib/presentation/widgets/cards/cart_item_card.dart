// lib/presentation/screens/cart/widgets/cart_item_card.dart
import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../data/models/cardtItem.dart';

class CartItemCard extends StatelessWidget {
  final CartItem item;
  final Function(int) onQuantityChanged;
  final VoidCallback onRemove;

  const CartItemCard({
    Key? key,
    required this.item,
    required this.onQuantityChanged,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onRemove(),
      background: _buildDismissBackground(),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: AppSizes.paddingM,
          vertical: AppSizes.paddingS,
        ),
        padding: const EdgeInsets.all(AppSizes.paddingM),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(AppSizes.radiusM),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            _buildProductImage(),
           const SizedBox(width: AppSizes.spaceM),
            _buildProductInfo(),
            _buildQuantityControls(),
          ],
        ),
      ),
    );
  }

  Widget _buildDismissBackground() {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.only(right: AppSizes.paddingL),
      margin: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingM,
        vertical: AppSizes.paddingS,
      ),
      decoration: BoxDecoration(
        color: AppColors.error,
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children:const  [
          Icon(
            Icons.delete_outline,
            color: AppColors.white,
            size: AppSizes.iconL,
          ),
          SizedBox(height: AppSizes.spaceXS),
          Text(
            'Eliminar',
            style: TextStyle(
              color: AppColors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(AppSizes.radiusS),
      ),
      child: Center(
        child: Text(
          item.image,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  Widget _buildProductInfo() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(
            item.name,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSizes.spaceXS),
          Text(
            'S/ ${item.price.toStringAsFixed(2)}',
            style:const  TextStyle(
              fontSize: 14,
              color: AppColors.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityControls() {
    return Row(
      children: [
        _buildQuantityButton(
          icon: Icons.remove,
          onTap: () => onQuantityChanged(item.quantity - 1),
        ),
       const  SizedBox(width: AppSizes.spaceM),
        Container(
          constraints: const BoxConstraints(minWidth: 24),
          child: Text(
            '${item.quantity}',
            style:const  TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(width: AppSizes.spaceM),
        _buildQuantityButton(
          icon: Icons.add,
          onTap: () => onQuantityChanged(item.quantity + 1),
        ),
      ],
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: AppColors.primary,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 4,
              offset: const  Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: AppColors.white,
          size: 20,
        ),
      ),
    );
  }
}