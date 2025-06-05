import 'package:flutter/material.dart';
import 'package:listo_app/presentation/screens/cart/cart_screen.dart';

import '../../../core/constants/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Botón de regreso
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.black),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                // Imagen del producto
                Center(
                  child: Image.asset(
                    'assets/images/food_sanwich_tripple.png',
                    height: 160,
                  ),
                ),
                const SizedBox(height: 16),
                // Nombre y descripción
                const Text(
                  'Sandwich de Pollo',
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Pollo desmenuzado en pan esponjoso',
                  style: TextStyle(fontSize: 18, color: Colors.black54),
                ),
                const SizedBox(height: 12),
                // Precio
                const Text(
                  'S/10.90',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                // Selector de cantidad y botón
                Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: AppColors.primary, width: 1.5),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove,
                                color: AppColors.primary),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                          ),
                          Text(
                            '$quantity',
                            style: const TextStyle(fontSize: 18),
                          ),
                          IconButton(
                            icon:
                                const Icon(Icons.add, color: AppColors.primary),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => CartScreen()),
                          );
                        },
                        child: const Text(
                          'AÑADIR AL CARRITO',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Información nutricional
                Row(
                  children: [
                    const Text(
                      'Información nutricional',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const SizedBox(width: 6),
                    Icon(Icons.info_outline, color: Colors.grey[500], size: 18),
                  ],
                ),
                const SizedBox(height: 12),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _NutritionInfo(value: '545 kcal', label: 'Calorías'),
                      _NutritionInfo(value: '35g', label: 'Carb'),
                      _NutritionInfo(value: '45g', label: 'Proteína'),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                // Productos relacionados
                const Text(
                  'Productos relacionados',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: const [
                      _RelatedProduct(
                        image: 'assets/images/food_sanwich_tripple.png',
                        name: 'Sandwich de Atún',
                        price: 'S/12.90',
                      ),
                      SizedBox(width: 12),
                      _RelatedProduct(
                        image: 'assets/images/food_sanwich_tripple.png',
                        name: 'Pan con Chicharrón',
                        price: 'S/14.90',
                      ),
                      SizedBox(width: 12),
                      _RelatedProduct(
                        image: 'assets/images/food_sanwich_tripple.png',
                        name: 'Sandwich de Pollo',
                        price: 'S/10.90',
                      ),
                      SizedBox(width: 12),
                      _RelatedProduct(
                        image: 'assets/images/food_sanwich_tripple.png',
                        name: 'Muffín de Arándanos',
                        price: 'S/6.50',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _NutritionInfo extends StatelessWidget {
  final String value;
  final String label;
  const _NutritionInfo({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.black54, fontSize: 13)),
      ],
    );
  }
}

class _RelatedProduct extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  const _RelatedProduct(
      {required this.image, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.primary, width: 1),
          ),
          child: Image.asset(image, fit: BoxFit.contain),
        ),
        const SizedBox(height: 6),
        Text(
          name,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          price,
          style: const TextStyle(
              fontSize: 12,
              color: AppColors.primary,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
