import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class PrimaxLoversButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const PrimaxLoversButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SizedBox(
        height: 40,
        child: FloatingActionButton.extended(
          onPressed: onPressed ??
              () {
                // Acción por defecto
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('¡Bienvenido a Primax Lovers!'),
                    duration: Duration(seconds: 2),
                  ),
                );
              },
          backgroundColor: AppColors.primaryLovers,
          foregroundColor: AppColors.primary,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          icon: const Icon(
            Icons.favorite,
            size: 20, // Icono más pequeño
          ),
          label: const Text(
            'Primax Lovers',
            style: TextStyle(
              fontSize: 14, // Texto más pequeño
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
