import 'package:flutter/material.dart';
import 'package:listo_app/presentation/screens/HomeView.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../widgets/forms/custom_checkbox.dart';
import '../home/home_screen.dart';

class PreferencesScreen extends StatefulWidget {
  const PreferencesScreen({super.key});

  @override
  State<PreferencesScreen> createState() => _PreferencesScreenState();
}

class _PreferencesScreenState extends State<PreferencesScreen> {
  // Estados para las categorías de productos
  bool _breakfastSelected = false;
  bool _snacksSelected = false;
  bool _dessertsSelected = false;
  bool _coffeeSelected = false;

  // Estados para los tipos de productos
  bool _sandwichesSelected = false;
  bool _drinksSelected = false;
  bool _sweetsSelected = false;

  void _onSave() {
    // Aquí puedes agregar la lógica para guardar las preferencias
    // Por ahora solo mostramos las selecciones
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Preferencias guardadas'),
        content:
            const Text('Tus preferencias han sido guardadas exitosamente.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => HomeView()),
              );
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Image.asset('assets/images/listo_logo.png', height: 60),
        centerTitle: true,
        backgroundColor: AppColors.surface,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppSizes.paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título principal
            Text(
              AppStrings.preferences,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 40),
            ),

            const SizedBox(height: AppSizes.spaceXL),

            // Sección: Categorías de productos
            Text(
              AppStrings.productCategories,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),

            const SizedBox(height: AppSizes.spaceM),

            // Checkboxes de categorías
            CustomCheckbox(
              title: AppStrings.breakfast,
              value: _breakfastSelected,
              onChanged: (value) {
                setState(() {
                  _breakfastSelected = value ?? false;
                });
              },
            ),

            CustomCheckbox(
              title: AppStrings.snacks,
              value: _snacksSelected,
              onChanged: (value) {
                setState(() {
                  _snacksSelected = value ?? false;
                });
              },
            ),

            CustomCheckbox(
              title: AppStrings.desserts,
              value: _dessertsSelected,
              onChanged: (value) {
                setState(() {
                  _dessertsSelected = value ?? false;
                });
              },
            ),

            CustomCheckbox(
              title: AppStrings.coffee,
              value: _coffeeSelected,
              onChanged: (value) {
                setState(() {
                  _coffeeSelected = value ?? false;
                });
              },
            ),

            const SizedBox(height: AppSizes.spaceXL),

            // Sección: Tipos de productos
            Text(
              AppStrings.productTypes,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w500,
                  fontSize: 22),
            ),

            const SizedBox(height: AppSizes.spaceM),

            // Checkboxes de tipos
            CustomCheckbox(
              title: AppStrings.sandwiches,
              value: _sandwichesSelected,
              onChanged: (value) {
                setState(() {
                  _sandwichesSelected = value ?? false;
                });
              },
            ),

            CustomCheckbox(
              title: AppStrings.drinks,
              value: _drinksSelected,
              onChanged: (value) {
                setState(() {
                  _drinksSelected = value ?? false;
                });
              },
            ),

            CustomCheckbox(
              title: AppStrings.sweets,
              value: _sweetsSelected,
              onChanged: (value) {
                setState(() {
                  _sweetsSelected = value ?? false;
                });
              },
            ),

            const SizedBox(height: AppSizes.spaceXL),

            // Información de pago
            Text(
              AppStrings.paymentInfo,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.textSecondary,
                    fontSize: 20,
                  ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: AppSizes.spaceXL),

            // Botón Guardar
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _onSave,
                child:
                    const Text(AppStrings.save, style: TextStyle(fontSize: 20)),
              ),
            ),

            // Espacio adicional para el scroll
            const SizedBox(height: AppSizes.spaceL),
          ],
        ),
      ),
    );
  }
}
