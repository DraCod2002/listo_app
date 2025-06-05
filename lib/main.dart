import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listo_app/presentation/screens/home/home_screen.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_routes.dart';
import 'presentation/screens/onboarding/preferences_screen.dart';

void main() {
  runApp(const ListoApp());
}

class ListoApp extends StatelessWidget {
  const ListoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configurar la barra de estado
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return MaterialApp(
      title: 'LiSTO!',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: AppRoutes.preferences,
      routes: {
        AppRoutes.preferences: (context) => const PreferencesScreen(),
        AppRoutes.home: (context) => const HomeScreen(),
      },
    );
  }
}