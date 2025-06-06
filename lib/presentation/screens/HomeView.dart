import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listo_app/presentation/screens/notifications/notifications_screen.dart';
import 'package:listo_app/presentation/screens/profile/profile_screen.dart';
import '../../core/constants/app_colors.dart';
import 'cart/cart_screen.dart';
import 'home/home_screen.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  // Lista de pantallas que corresponden a cada tab
  final List<Widget> _screens = [
    const HomeScreen(),
    const CartScreen(),
    const HomeScreen(),
    const NotificationsScreen(),
    const ProfileScreen(),

  ];

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
        },
        type: BottomNavigationBarType.fixed, // Para mostrar más de 3 items
        iconSize: 32, 
        selectedItemColor: AppColors.primary, // Color cuando está seleccionado
        unselectedItemColor: Colors.grey, // Color cuando no está seleccionado
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        unselectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Carrito' ,
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_rounded),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notificaciones',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
