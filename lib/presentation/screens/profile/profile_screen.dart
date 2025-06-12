import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/constants/app_colors.dart';
import '../history/history_compras.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
            child: Column(
              children: [
                SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // Sección Mi cuenta
                      const Text(
                        'Mi cuenta',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Opciones de cuenta
                      _buildMenuCard([
                        _buildMenuItem(
                          icon: Icons.person_outline,
                          title: 'Franco Encalada',
                          subtitle: 'fencalada@focusit.pe.',
                          onTap: () {
                            _showAccountModal(context);
                          },
                        ),
                        const Divider(height: 1),
                        _buildMenuItem(
                          icon: Icons.badge_outlined,
                          title: 'DNI',
                          subtitle: '74215365',
                          onTap: () {
                            // Navegación a medios de pago
                          },
                        ),
                      ]),

                      const SizedBox(height: 24),

                      // Sección Configuraciones y permisos
                      const Text(
                        'Historial y notificaciones',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Opciones de configuración
                      _buildMenuCard([
                        _buildMenuItem(
                          icon: Icons.receipt_long_outlined,
                          title: 'Historial de compras',
                          subtitle: 'acceder al historial de compras realizadas.',
                          onTap: () {
                            context.push('/history_compras');
                          },
                        ),
                        const Divider(height: 1),
                        _buildMenuItem(
                            icon: Icons.notifications_outlined,
                            title: 'Notificaciones',
                            subtitle: 'Todas mis Notifiaciones',
                            onTap: () {
                              context.go('/home-view', extra: 2);
                            }),
                      ]),

                      const SizedBox(height: 40),
                    ],
                  ),
                ),

                // Versión al final de la pantalla
                _buildVersionInfo(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Nuevo método para mostrar el modal de cuenta
  void _showAccountModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Indicador visual del modal
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(top: 12),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              const SizedBox(height: 24),

              // Icono de usuario
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B35).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: const Icon(
                  Icons.person,
                  size: 30,
                  color: Color(0xFFFF6B35),
                ),
              ),

              const SizedBox(height: 16),

              // Título
              const Text(
                'Gestión de Cuenta',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8),

              // Subtítulo
              const Text(
                '¿Qué acción deseas realizar?',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),

              const SizedBox(height: 32),

              // Botones de acción
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    // Botón para regresar a cuenta principal
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Aquí puedes agregar la lógica para regresar a la cuenta principal
                          _returnToMainAccount(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF6B35),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Regresar a cuenta principal',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Botón para editar información
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          // Aquí puedes agregar la lógica para editar información
                          _editUserInfo(context);
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFFFF6B35),
                          side: const BorderSide(color: Color(0xFFFF6B35)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Editar información',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Botón para cancelar
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancelar',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        );
      },
    );
  }

  // Método para regresar a la cuenta principal
  void _returnToMainAccount(BuildContext context) {
    // Aquí puedes implementar la lógica para regresar a la cuenta principal
    // Por ejemplo: cerrar sesión, navegar a login, etc.
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Regresando a cuenta principal...'),
        backgroundColor: Color(0xFFFF6B35),
      ),
    );

    // Ejemplo de navegación (ajusta según tu estructura de rutas)
    // context.go('/login');
  }

  // Método para editar información del usuario
  void _editUserInfo(BuildContext context) {
    // Aquí puedes implementar la navegación a la pantalla de edición
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Abriendo edición de perfil...'),
        backgroundColor: Color(0xFFFF6B35),
      ),
    );

    // Ejemplo de navegación (ajusta según tu estructura de rutas)
    // context.push('/edit-profile');
  }

  Widget _buildVersionInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 16),
      child: Center(
        child: Text(
          'v 1.0.1  02.06.25',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.0,
          ),
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