import 'package:flutter/material.dart';
import 'package:listo_app/presentation/screens/order/order_confirmation_screen.dart';
import 'package:listo_app/presentation/widgets/cards/order_confirmation_card.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';

class PaymentButtons extends StatelessWidget {
  final double total;
  final VoidCallback onBackToStorePressed;

  const PaymentButtons({
    Key? key,
    required this.total,
    required this.onBackToStorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppSizes.paddingM),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Información de pago
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSizes.paddingM,
                vertical: AppSizes.paddingS,
              ),
              decoration: BoxDecoration(
                color: AppColors.grey100,
                borderRadius: BorderRadius.circular(AppSizes.radiusS),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.info_outline,
                    size: AppSizes.iconS,
                    color: AppColors.textSecondary,
                  ),
                  SizedBox(width: AppSizes.spaceS),
                  Expanded(
                    child: Text(
                      'El pago se realiza solo con Apple Pay',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            
           const SizedBox(height: AppSizes.spaceM),
            
            // Botón Apple Pay
            _buildApplePayButton(context),
            
            const SizedBox(height: AppSizes.spaceS),
            
            // Botón volver a la tienda
            _buildBackToStoreButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildApplePayButton(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: ElevatedButton(
        onPressed: (){
          Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                              builder: (context) => const  OrderConfirmationScreen()),
                        );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadiusDefault),
          ),
          elevation: AppSizes.elevationLow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icono de Apple Pay (en producción usarías un SVG o imagen)
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: Text(
                  '',
                  style: TextStyle(
                    color: AppColors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
           const SizedBox(width: AppSizes.spaceS),
           const Text(
            
              'Pagar con Apple Pay',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            Spacer(),
            
            Text(
              'S/ ${total.toStringAsFixed(2)}',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackToStoreButton() {
    return Container(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: OutlinedButton(
        onPressed: onBackToStorePressed,
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: AppColors.primary, width: 2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.buttonRadiusDefault),
          ),
        ),
        child: const Text(
          'Volver a la tienda',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}