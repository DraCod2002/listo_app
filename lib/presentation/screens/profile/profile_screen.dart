
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: const Color(0xFFFF6B35),
        elevation: 0,
        title: Image.asset(
          'assets/images/listo_logo_home.png', // Reemplazar con el logo real
          height: 40,
          errorBuilder: (context, error, stackTrace) {
            return const Text(
              'LiSTO!',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            );
          },
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header con nombre
            const Text(
              'Franco Encalada',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            
            // Sección Mi cuenta
            const Text(
              'Mi cuenta',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            
            // Opciones de cuenta
            _buildMenuCard([
              _buildMenuItem(
                icon: Icons.person_outline,
                title: 'Mi información',
                subtitle: 'Edita tus datos personales.',
                onTap: () {
                  // Navegación a información personal
                },
              ),
              const Divider(height: 1),
              _buildMenuItem(
                icon: Icons.credit_card_outlined,
                title: 'Mis medios de pago',
                subtitle: 'Configura tu tarjeta.',
                onTap: () {
                  // Navegación a medios de pago
                },
              ),
            ]),
            
            const SizedBox(height: 24),
            
            // Sección Configuraciones y permisos
            const Text(
              'Configuraciones y permisos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            
            // Opciones de configuración
            _buildMenuCard([
              _buildMenuItem(
                icon: Icons.fingerprint,
                title: 'Datos biométricos',
                subtitle: 'Habilita el uso de tu huella digital para ingresar a la App.',
                onTap: () {
                  // Navegación a datos biométricos
                },
              ),
              const Divider(height: 1),
              _buildMenuItem(
                icon: Icons.notifications_outlined,
                title: 'Notificaciones',
                subtitle: 'Configura las alertas y recordatorios.',
                onTap: () {
                  Navigator.pushNamed(context, '/notifications');
                },
              ),
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuCard(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(children: children),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFFF6B35).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: const Color(0xFFFF6B35),
          size: 24,
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black54,
        ),
      ),
      trailing: const Icon(
        Icons.chevron_right,
        color: Colors.black38,
      ),
      onTap: onTap,
    );
  }
}
