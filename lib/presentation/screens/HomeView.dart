import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listo_app/presentation/screens/notifications/notifications_screen.dart';
import 'package:listo_app/presentation/screens/profile/profile_screen.dart';
import '../../core/constants/app_colors.dart';
import 'cart/cart_screen.dart';
import 'home/home_screen.dart';
import 'notifications/notifications_home.dart';
// Importa el widget de badge que creamos
import '../widgets/badge_widget.dart'; // Ajusta la ruta según tu estructura

class HomeView extends StatefulWidget {
  final int initialIndex;

  const HomeView({super.key, this.initialIndex = 0});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  // Estado para el carrito y notificaciones
  int _cartItemCount = 0;
  bool _hasUnreadNotifications = false;

  // Lista de pantallas que corresponden a cada tab
  final List<Widget> _screens = [
    const HomeScreen(),
    const CartScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _loadInitialData();
  }

  // Método para cargar datos iniciales
  void _loadInitialData() {
    // Aquí puedes cargar el estado real del carrito y notificaciones
    // Por ejemplo, desde SharedPreferences, Provider, Bloc, etc.
    _loadCartData();
    _loadNotificationData();
  }

  // Simulación de carga de datos del carrito
  void _loadCartData() {
    // Aquí conectarías con tu provider/bloc/servicio real
    // Por ahora simulamos algunos productos en el carrito
    setState(() {
      _cartItemCount = 3; // Ejemplo: 3 productos en el carrito
    });
  }

  // Simulación de carga de datos de notificaciones
  void _loadNotificationData() {
    // Aquí conectarías con tu provider/bloc/servicio real
    setState(() {
      _hasUnreadNotifications = true; // Ejemplo: hay notificaciones sin leer
    });
  }

  // Método para actualizar el contador del carrito (puedes llamarlo desde otras pantallas)
  void updateCartCount(int newCount) {
    setState(() {
      _cartItemCount = newCount;
    });
  }

  // Método para actualizar el estado de notificaciones
  void updateNotificationStatus(bool hasUnread) {
    setState(() {
      _hasUnreadNotifications = hasUnread;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Removido el código que ocultaba la burbuja de notificaciones
          // La burbuja permanecerá visible
        },
        type: BottomNavigationBarType.fixed,
        iconSize: 28,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 14,
        ),
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: CartBadge(
              cartItemCount: _cartItemCount,
              child: const Icon(Icons.shopping_cart),
            ),
            label: 'Carrito',
          ),
          BottomNavigationBarItem(
            icon: NotificationBadge(
              hasNotifications: _hasUnreadNotifications,
              child: const Icon(Icons.notifications),
            ),
            label: 'Notificaciones',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

// Extensión para facilitar el acceso desde otras pantallas
extension HomeViewExtension on HomeViewState {
  void addToCart() {
    updateCartCount(_cartItemCount + 1);
  }

  void removeFromCart() {
    if (_cartItemCount > 0) {
      updateCartCount(_cartItemCount - 1);
    }
  }

  void clearCart() {
    updateCartCount(0);
  }

  void markNotificationsAsRead() {
    updateNotificationStatus(false);
  }

  void newNotificationReceived() {
    updateNotificationStatus(true);
  }
}