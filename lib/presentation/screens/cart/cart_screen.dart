import 'package:flutter/material.dart';
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
      name: 'Club Sándwich',
      price: 24.00,
      quantity: 1,
      image: '🥪',
    ),
    CartItem(
      id: '2',
      name: 'Agua sin gas',
      price: 3.50,
      quantity: 2,
      image: '🫗',
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
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppSizes.spaceM),

                  // Items del carrito
                  if (cartItems.isNotEmpty) ...[
                    ...cartItems
                        .map((item) => CartItemCard(
                              item: item,
                              onQuantityChanged: (newQuantity) =>
                                  _updateQuantity(item.id, newQuantity),
                              onRemove: () => _removeItem(item.id),
                            ))
                        .toList(),

                    const SizedBox(height: AppSizes.spaceL),

                    // Resumen del pedido
                    OrderSummaryCard(
                      subtotal: subtotal,
                      taxes: taxes,
                      total: total,
                      deliveryTime: '15-20 min',
                    ),

                    const SizedBox(height: AppSizes.spaceM),

                    // Checkbox enviar boleta
                    _buildReceiptCheckbox(),

                    const SizedBox(height: AppSizes.spaceL),

                    // Productos de última hora
                    LastHourProducts(),

                    const SizedBox(height: AppSizes.spaceL),
                  ] else ...[
                    _buildEmptyCart(),
                  ],
                ],
              ),
            ),
          ),

          // Botones de pago
          if (cartItems.isNotEmpty)
            PaymentButtons(
              total: total,
              onBackToStorePressed: () => Navigator.pop(context),
            ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      title: Image.asset(
        'assets/images/listo_logo.png',
        height: 44,
      ),
      centerTitle: true,
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
        'Carrito de compra',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textPrimary,
        ),
      ),
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
            'Enviar boleta a mi correo',
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
              'Tu carrito está vacío',
              style: TextStyle(
                fontSize: 18,
                color: AppColors.textSecondary,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: AppSizes.spaceS),
            Text(
              'Agrega productos para continuar',
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

  void _handleApplePayment() {
    // Implementar lógica de pago con Apple Pay
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Procesando pago con Apple Pay...'),
        backgroundColor: AppColors.success,
      ),
    );
  }
}
