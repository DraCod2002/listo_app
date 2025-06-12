import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listo_app/presentation/screens/cart/cart_screen.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../HomeView.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 1;

  void _addToCart() {
    // Mostrar SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 20,
            ),
            SizedBox(width: 8),
            Text(
              'Producto añadido al carrito',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar igual que el BreakfastScreen
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
                padding: const EdgeInsets.all(AppSizes.paddingXS),
                child: Row(
                  children: [
                    // Botón de volver
                    GestureDetector(
                      onTap: () => context.push('/home-view'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.paddingS,
                          vertical: AppSizes.paddingXS,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                              size: 12,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Volver',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    // Logo
                    Image.asset(
                      'assets/images/listo_logo_home.png',
                      height: 35,
                    ),
                    const Spacer(flex: 2),
                    const SizedBox(width: AppSizes.iconM),
                  ],
                ),
              ),
            ),
          ),

          // Contenido principal
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: AppSizes.spaceL),

                  // Imagen del producto
                  Center(
                    child: Image.asset(
                      'assets/images/food_sanwich_tripple.png',
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 36),

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
                  const SizedBox(height: 24),
                  // Productos relacionados
                  const Text(
                    'Productos relacionados',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 180,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _RelatedProduct(
                          image: 'assets/images/food_sanwich_tripple.png',
                          name: 'Sandwich de Atún',
                          price: 'S/12.90',
                          onTap: () {
                            context.push('/product-detail');
                          },
                        ),
                        SizedBox(width: 16),
                        _RelatedProduct(
                          image: 'assets/images/food_sanwich.png',
                          name: 'Pan con Chicharrón',
                          price: 'S/14.90',
                          onTap: () {
                            context.push('/product-detail');
                          },
                        ),
                        SizedBox(width: 16),
                        _RelatedProduct(
                          image: 'assets/images/food_empanada.png',
                          name: 'Sandwich de Pollo',
                          price: 'S/10.90',
                          onTap: () {
                            context.push('/product-detail');
                          },
                        ),
                        SizedBox(width: 16),
                        _RelatedProduct(
                          image: 'assets/images/food_sanwich_tripple.png',
                          name: 'Muffín de Arándanos',
                          price: 'S/6.50',
                          onTap: () {
                            context.push('/product-detail');
                          },
                        ),
                      ],
                    ),
                  ),

                  // Espacio adicional para el scroll (más espacio para la barra fija)
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ),
        ],
      ),
      // Barra fija en la parte inferior
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Tu producto - precio
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tu producto',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      'S/ 10.90',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // Selector de cantidad y botón añadir
                Row(
                  children: [
                    // Selector de cantidad más pequeño y redondeado
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.primary, width: 1),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove, color: Colors.black54, size: 26),
                            onPressed: () {
                              setState(() {
                                if (quantity > 1) quantity--;
                              });
                            },
                            constraints: const BoxConstraints(
                              minWidth: 35,
                              minHeight: 35,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18),
                            child: Text(
                              '$quantity',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.add, color: Colors.black54, size: 26),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            constraints: const BoxConstraints(
                              minWidth: 35,
                              minHeight: 35,
                            ),
                            padding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Botón "Agregar" más redondeado y similar al diseño
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          elevation: 0,
                        ),
                        onPressed: _addToCart, // Cambio aquí: llama a la función _addToCart
                        child: const Text(
                          'Añadir al carrito',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(value,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        const SizedBox(height: 4),
        Text(label,
            style: const TextStyle(color: Colors.black54, fontSize: 16)),
      ],
    );
  }
}

class _RelatedProduct extends StatelessWidget {
  final String image;
  final String name;
  final String price;
  final VoidCallback? onTap;

  const _RelatedProduct({
    required this.image,
    required this.name,
    required this.price,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(image, fit: BoxFit.contain),
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
            Text(
              price,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}