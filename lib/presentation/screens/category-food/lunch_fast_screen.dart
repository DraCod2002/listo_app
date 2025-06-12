import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listo_app/presentation/screens/product-details/product_details_screen.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../widgets/cards/product_card.dart';

class LunchScreen extends StatefulWidget {
  const LunchScreen({super.key});

  @override
  State<LunchScreen> createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: CustomScrollView(
        slivers: [
          // SliverAppBar igual que el Home
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
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSizes.paddingS,
                          vertical: AppSizes.paddingXS,
                        ),
                        child:  Row(
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
                    const Spacer( flex: 2),
                    const SizedBox(width: AppSizes.iconM),
                  ],
                ),
              ),
            ),
          ),

          // Contenido principal
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppSizes.spaceL),

                // Título de la sección
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
                  child: Text(
                    'Almuerzos',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Colors.black87,
                    ),
                  ),
                ),


                // Lista de productos de almuerzo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
                  child: Column(
                    children: [
                      // Arroz con pollo
                      _buildProductItem(
                        context,
                        imagePath: 'assets/images/food_arroz_pollo.png',
                        name: 'Arroz con pollo',
                        price: 'S/ 18.90',
                        onTap: () {
                          context.push('/product-detail');
                        },
                      ),

                      const SizedBox(height: AppSizes.spaceL),

                      // Tallarín saltado
                      _buildProductItem(
                        context,
                        imagePath: 'assets/images/food_tallarin_saltado.png',
                        name: 'Tallarín saltado',
                        price: 'S/ 16.50',
                        onTap: () {
                          context.push('/product-detail');
                        },
                      ),

                      const SizedBox(height: AppSizes.spaceL),

                      // Lomo saltado
                      _buildProductItem(
                        context,
                        imagePath: 'assets/images/food_lomo_saltado.png',
                        name: 'Lomo saltado',
                        price: 'S/ 22.90',
                        onTap: () {
                          context.push('/product-detail');
                        },
                      ),

                      const SizedBox(height: AppSizes.spaceL),

                      // Ají de gallina
                      _buildProductItem(
                        context,
                        imagePath: 'assets/images/food_aji_gallina.png',
                        name: 'Ají de gallina',
                        price: 'S/ 19.50',
                        onTap: () {
                          context.push('/product-detail');
                        },
                      ),

                      const SizedBox(height: AppSizes.spaceL),

                      // Pollo a la brasa
                      _buildProductItem(
                        context,
                        imagePath: 'assets/images/food_pollo_brasa.png',
                        name: 'Pollo a la brasa',
                        price: 'S/ 24.90',
                        onTap: () {
                          context.push('/product-detail');
                        },
                      ),
                    ],
                  ),
                ),

                // Espacio adicional para el scroll
                const SizedBox(height: AppSizes.spaceXXL),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(
      BuildContext context, {
        required String imagePath,
        required String name,
        required String price,
        required VoidCallback onTap,
      }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(AppSizes.paddingM),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Imagen del producto
            Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey.shade50,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade100,
                      child: Icon(
                        Icons.fastfood,
                        color: Colors.grey.shade400,
                        size: 32,
                      ),
                    );
                  },
                ),
              ),
            ),

            const SizedBox(width: AppSizes.spaceL),

            // Información del producto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 26,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: AppSizes.spaceXS),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            // Icono de flecha
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey.shade400,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}