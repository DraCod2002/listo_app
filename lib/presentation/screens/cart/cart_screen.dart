
import 'package:flutter/material.dart';
import '../../../core/constants/app_strings.dart';
import '../../../data/models/cardtItem.dart';
import '../../widgets/cards/cart_item_card.dart';
import '../../widgets/cards/order_summary_card.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../widgets/last_hour_products.dart';
import '../../widgets/payment_buttons.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Lista de productos en el carrito
  List<CartItem> cartItems = [
    CartItem(
      id: '1',
      name: AppStrings.clubSandwich,
      price: 24.00,
      quantity: 1,
      image: 'assets/images/food_sanwich_tripple.png', // Cambiado a imagen real
    ),
    CartItem(
      id: '2',
      name: AppStrings.waterNoGas,
      price: 3.50,
      quantity: 2,
      image: 'assets/images/food_agua.png', // Cambiado a imagen real
    ),
  ];

  bool sendReceipt = true;

  double get subtotal =>
      cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));
  double get taxes => 2.00;
  double get total => subtotal + taxes;

  void _updateQuantity(String itemId, int newQuantity) {
    setState(() {
      if (newQuantity <= 0) {
        cartItems.removeWhere((item) => item.id == itemId);
      } else {
        final index = cartItems.indexWhere((item) => item.id == itemId);
        if (index != -1) {
          cartItems[index].quantity = newQuantity;
        }
      }
    });
  }

  void _removeItem(String itemId) {
    setState(() {
      cartItems.removeWhere((item) => item.id == itemId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                // SliverAppBar igual al de HomeScreen
                SliverAppBar(
                  backgroundColor: AppColors.primary,
                  elevation: 0,
                  expandedHeight: 85,
                  floating: true,
                  snap: true,
                  pinned: false,
                  automaticallyImplyLeading: false,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        children: [
                          const Spacer(),
                          Image.asset(
                            'assets/images/listo_logo_home.png',
                            height: 45,
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),

                // Contenido principal del carrito
                SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      // Items del carrito
                      if (cartItems.isNotEmpty) ...[
                        ...cartItems
                            .map((item) => _buildCartItemCard(item))
                            .toList(),

                        const SizedBox(height: AppSizes.spaceL),

                        // Resumen del pedido con fuente más grande
                        _buildOrderSummaryCard(),

                        const SizedBox(height: AppSizes.spaceM),

                        // Checkbox enviar boleta
                        _buildReceiptCheckbox(),

                        const SizedBox(height: AppSizes.spaceL),

                        // Productos de última hora
                        LastHourProducts(),
                      ] else ...[
                        _buildEmptyCart(),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Botones de pago (fijos en la parte inferior)
          if (cartItems.isNotEmpty)
            PaymentButtons(
              total: total,
              onBackToStorePressed: () => Navigator.pop(context),
            ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingM,
        vertical: AppSizes.paddingL,
      ),
      child: const Text(
        AppStrings.shoppingCart,
        style: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
    );
  }

  // Widget personalizado para cart item con imágenes y texto más grandes
  Widget _buildCartItemCard(CartItem item) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppSizes.paddingM,
        vertical: AppSizes.paddingXS,
      ),
      padding: const EdgeInsets.all(AppSizes.paddingM),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Imagen más grande
          ClipRRect(
            borderRadius: BorderRadius.circular(AppSizes.radiusS),
            child: Image.asset(
              item.image,
              width: 100,
              height: 100,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.grey100,
                    borderRadius: BorderRadius.circular(AppSizes.radiusS),
                  ),
                  child: const Icon(
                    Icons.image_not_supported,
                    color: AppColors.grey400,
                    size: 40,
                  ),
                );
              },
            ),
          ),

          const SizedBox(width: AppSizes.spaceM),

          // Información del producto
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 18, // Aumentado de ~14-16 a 18
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'S/. ${item.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 16, // Aumentado de ~12-14 a 16
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
          ),

          // Controles de cantidad
          Row(
            children: [
              _buildQuantityButton(
                icon: Icons.remove,
                onPressed: () => _updateQuantity(item.id, item.quantity - 1),
              ),
              Container(
                width: 40,
                alignment: Alignment.center,
                child: Text(
                  '${item.quantity}',
                  style: const TextStyle(
                    fontSize: 18, // Texto de cantidad más grande
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
              _buildQuantityButton(
                icon: Icons.add,
                onPressed: () => _updateQuantity(item.id, item.quantity + 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: AppColors.grey100,
          borderRadius: BorderRadius.circular(AppSizes.radiusS),
        ),
        child: Icon(
          icon,
          size: 20,
          color: AppColors.primary,
        ),
      ),
    );
  }

  // Resumen del pedido con fuente más grande
  Widget _buildOrderSummaryCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
      padding: const EdgeInsets.all(AppSizes.paddingM),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSizes.radiusM),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Resumen del pedido',
            style: TextStyle(
              fontSize: 20, // Aumentado
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),
          const SizedBox(height: AppSizes.spaceM),

          _buildSummaryRow('Subtotal', subtotal, fontSize: 16),
          const SizedBox(height: AppSizes.spaceS),
          _buildSummaryRow('Impuestos', taxes, fontSize: 16),
          const SizedBox(height: AppSizes.spaceS),
          _buildSummaryRow('Tiempo de entrega', null,
              value: '15-20 min', fontSize: 16),

          const Divider(height: 24),

          _buildSummaryRow('Total', total,
              fontSize: 18, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, double? amount, {
    String? value,
    double fontSize = 14,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: AppColors.textPrimary,
          ),
        ),
        Text(
          value ?? 'S/. ${amount!.toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: AppColors.textPrimary,
          ),
        ),
      ],
    );
  }


  Widget _buildReceiptCheckbox() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => setState(() => sendReceipt = !sendReceipt),
            child: Container(
              width: AppSizes.checkboxSize,
              height: AppSizes.checkboxSize,
              decoration: BoxDecoration(
                color: sendReceipt ? AppColors.primary : Colors.transparent,
                border: sendReceipt
                    ? null
                    : Border.all(color: AppColors.checkboxBorder),
                borderRadius: BorderRadius.circular(AppSizes.radiusXS),
              ),
              child: sendReceipt
                  ? const Icon(Icons.check, color: AppColors.white, size: 16)
                  : null,
            ),
          ),
          const SizedBox(width: AppSizes.spaceS),
          const Text(
            AppStrings.sendReceiptToEmail,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Container(
      height: 400,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.shopping_cart_outlined,
              size: 80,
              color: AppColors.grey400,
            ),
            SizedBox(height: AppSizes.spaceM),
            Text(
              AppStrings.emptyCartSubtitle,
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: AppSizes.spaceS),
            Text(
              AppStrings.emptyCartSubtitle,
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textHint,
              ),
            ),
          ],
        ),
      ),
    );
  }

}