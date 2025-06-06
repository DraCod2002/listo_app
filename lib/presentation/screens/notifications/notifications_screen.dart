import 'package:flutter/material.dart';
import 'package:listo_app/core/constants/app_colors.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: [
          // SliverAppBar que desaparece al hacer scroll
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
                padding: const EdgeInsets.all(3.0), // AppSizes.paddingXS
                child: Row(
                  children: [
                    const Spacer(),
                    Image.asset(
                      'assets/images/listo_logo_home.png',
                      height: 45,
                    ),
                    const Spacer(),
                    const SizedBox(width: 24.0), // AppSizes.iconM
                  ],
                ),
              ),
            ),
          ),
          
          // Contenido principal
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Notificaciones',
                    style: TextStyle(
                      fontSize: 32, // Aumentado de 28 a 32
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          
          // Lista de notificaciones
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildNotificationItem(
                  title: 'Pedido Recibido',
                  time: 'hace 5 min',
                  isNew: true,
                ),
                _buildNotificationItem(
                  title: 'Pedido listo en 5 min',
                  time: 'hace 1 h',
                  isNew: false,
                ),
                _buildNotificationItem(
                  title: 'Pedido listo para recojo',
                  time: 'hace 1 día',
                  isNew: false,
                ),
                _buildNotificationItem(
                  title: 'Recordatorio para hacer pedido',
                  time: 'hace 3 días',
                  isNew: false,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String time,
    required bool isNew,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isNew ? const Color(0xFFFFE4D6) : const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
        border: isNew 
          ? Border.all(color: const Color(0xFFFF6B35).withOpacity(0.3))
          : null,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12), // Aumentado el padding vertical
        leading: Container(
          width: 10, // Ligeramente más grande
          height: 10,
          decoration: BoxDecoration(
            color: isNew ? const Color(0xFFFF6B35) : Colors.transparent,
            shape: BoxShape.circle,
          ),
        ),
        title: Row(
          children: [
            const Text(
              'Notificación',
              style: TextStyle(
                fontSize: 14, // Aumentado de 12 a 14
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              time,
              style: const TextStyle(
                fontSize: 14, // Aumentado de 12 a 14
                color: Colors.black54,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6), // Ligeramente más espacio
          child: Text(
            title,
            style: TextStyle(
              fontSize: 18, // Aumentado de 16 a 18
              fontWeight: isNew ? FontWeight.w600 : FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ),
        onTap: () {
          // Acción al tocar la notificación
        },
      ),
    );
  }
}