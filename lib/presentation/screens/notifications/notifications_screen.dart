import 'package:flutter/material.dart';
import 'package:listo_app/core/constants/app_colors.dart';

import '../../../core/constants/app_sizes.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  int? selectedNotificationIndex;

  // Lista de notificaciones con más contenido
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Pedido Recibido',
      'time': 'hace 5 min',
      'isNew': true,
      'description': 'Tu pedido #1234 ha sido recibido correctamente'
    },
    {
      'title': 'Pedido listo en 5 min',
      'time': 'hace 1 h',
      'isNew': false,
      'description': 'Tu pedido estará listo para recoger muy pronto'
    },
    {
      'title': 'Pedido listo para recojo',
      'time': 'hace 1 día',
      'isNew': false,
      'description': 'Tu pedido #1230 está disponible en el mostrador'
    },
    {
      'title': 'Recordatorio para hacer pedido',
      'time': 'hace 3 días',
      'isNew': false,
      'description': '¡No olvides hacer tu pedido habitual!'
    },
    {
      'title': 'Nuevo menú disponible',
      'time': 'hace 1 semana',
      'isNew': false,
      'description': 'Tenemos nuevos platos deliciosos para ti'
    },
    {
      'title': 'Promoción especial',
      'time': 'hace 1 semana',
      'isNew': false,
      'description': '20% de descuento en tu próxima orden'
    },
    {
      'title': 'Pedido cancelado',
      'time': 'hace 2 semanas',
      'isNew': false,
      'description': 'Tu pedido #1225 fue cancelado exitosamente'
    },
    {
      'title': 'Califica tu experiencia',
      'time': 'hace 2 semanas',
      'isNew': false,
      'description': '¿Cómo fue tu última visita? Comparte tu opinión'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
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
                    const Spacer(),// AppSizes.iconM
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
                  const SizedBox(height: AppSizes.spaceS),
                ],
              ),
            ),
          ),

          // Lista de notificaciones
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return _buildNotificationItem(
                    index: index,
                    title: notifications[index]['title'],
                    time: notifications[index]['time'],
                    isNew: notifications[index]['isNew'],
                    description: notifications[index]['description'],
                  );
                },
                childCount: notifications.length,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required int index,
    required String title,
    required String time,
    required bool isNew,
    required String description,
  }) {
    final bool isSelected = selectedNotificationIndex == index;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isSelected
            ? const Color(0xFFE3F2FD) // Azul claro cuando está seleccionado
            : isNew
            ? const Color(0xFFFFE4D6) // Naranja claro para nuevas
            : const Color(0xFFF5F5F5), // Gris claro para normales
        borderRadius: BorderRadius.circular(12),
        border: isSelected
            ? Border.all(color: const Color(0xFF2196F3).withOpacity(0.5), width: 2)
            : isNew
            ? Border.all(color: const Color(0xFFFF6B35).withOpacity(0.3))
            : null,
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: isSelected
                ? const Color(0xFF2196F3) // Azul para seleccionado
                : isNew
                ? const Color(0xFFFF6B35) // Naranja para nuevo
                : Colors.transparent,
            shape: BoxShape.circle,
          ),
        ),
        title: Row(
          children: [
            const Text(
              'Notificación',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              time,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: isSelected
                      ? FontWeight.w700
                      : isNew
                      ? FontWeight.w600
                      : FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          setState(() {
            // Si ya está seleccionada, la deselecciona, sino la selecciona
            selectedNotificationIndex = selectedNotificationIndex == index ? null : index;
          });
        },
      ),
    );
  }
}