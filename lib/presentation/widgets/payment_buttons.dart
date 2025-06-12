import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
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
        child: Column(
          children: [
            // Botón Apple Pay
            _buildApplePayButton(context),

            // Botón volver a la tienda
            //_buildBackToStoreButton(),
          ],
        ),
    );
  }

  Widget _buildApplePayButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppSizes.buttonHeight,
      child: ElevatedButton(
        onPressed: () {
          context.push('/apple-pay');
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
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Center(
                child: Icon(FontAwesomeIcons.apple)
              ),
            ),
            const SizedBox(width: AppSizes.spaceS),
            const Text(
              'Pagar con Apple Pay',
              style: TextStyle(
                color: AppColors.white,
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  /*Widget _buildBackToStoreButton() {
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
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }*/
}
