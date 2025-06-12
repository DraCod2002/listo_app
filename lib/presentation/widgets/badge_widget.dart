import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  final Widget child;
  final int? count;
  final bool showBadge;
  final Color badgeColor;
  final Color textColor;
  final double badgeSize;

  const BadgeWidget({
    super.key,
    required this.child,
    this.count,
    this.showBadge = true,
    this.badgeColor = const Color(0xFF2196F3), // Azul medio/celeste
    this.textColor = Colors.white,
    this.badgeSize = 18,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (showBadge)
          Positioned(
            right: -4,
            top: -4,
            child: Container(
              padding: count != null
                  ? const EdgeInsets.symmetric(horizontal: 4,)
                  : const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: badgeColor,
                borderRadius: BorderRadius.circular(10), // Más redondo
                border: Border.all(
                  color: Colors.white,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: badgeColor.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              constraints: BoxConstraints(
                minWidth: badgeSize,
                minHeight: badgeSize,
              ),
              child: count != null
                  ? Center(
                child: Text(
                  count! > 99 ? '99+' : count.toString(),
                  style: TextStyle(
                    color: textColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
                  : null,
            ),
          ),
      ],
    );
  }
}

// Widget específico para el carrito
class CartBadge extends StatelessWidget {
  final Widget child;
  final int cartItemCount;

  const CartBadge({
    super.key,
    required this.child,
    required this.cartItemCount,
  });

  @override
  Widget build(BuildContext context) {
    return BadgeWidget(
      showBadge: cartItemCount > 0,
      count: cartItemCount,
      badgeColor: const Color(0xFF2196F3), // Azul celeste
      child: child,
    );
  }
}

// Widget específico para notificaciones
class NotificationBadge extends StatelessWidget {
  final Widget child;
  final bool hasNotifications;

  const NotificationBadge({
    super.key,
    required this.child,
    required this.hasNotifications,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (hasNotifications)
          Positioned(
            right: -2, // Más cerca del ícono
            top: -2,   // Más cerca del ícono
            child: Container(
              width: 16,  // Tamaño fijo más grande
              height: 16, // Tamaño fijo más grande
              decoration: BoxDecoration(
                color: const Color(0xFF2196F3), // Azul celeste
                shape: BoxShape.circle, // Perfectamente circular
                border: Border.all(
                  color: Colors.white,
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF2196F3).withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}