import 'package:flutter/material.dart';
import 'package:listo_app/presentation/screens/history/history_compras.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../widgets/cards/category_card.dart';
import '../../widgets/cards/product_card.dart';
import '../productDetails/product_details_screen.dart';
import 'widgets/special_offers_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                padding: const EdgeInsets.all(AppSizes.paddingXS),
                child: Row(
                  children: [
                    const Spacer(),
                    Image.asset(
                      'assets/images/listo_logo_home.png',
                      height: 45,
                    ),
                    const Spacer(),
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

                // Carousel de ofertas especiales
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
                  child: SpecialOffersCarousel(),
                ),

                const SizedBox(height: AppSizes.spaceXL),

                // Sección de Categorías
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
                  child: Text(
                    AppStrings.categories,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                ),

                // Grid de categorías
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    mainAxisSpacing: AppSizes.spaceM,
                    crossAxisSpacing: AppSizes.spaceM,
                    childAspectRatio: 0.85,
                    children: [
                      CategoryCard(
                        title: AppStrings.breakfast,
                        icon: Image.asset(
                          'assets/icons/icon_category_1.png',
                          height: 24,
                        ),
                        backgroundColor: AppColors.categoryBackground1,
                        onTap: () {
                          // Navegar a categoría de desayunos
                        },
                      ),
                      CategoryCard(
                        title: AppStrings.lunch,
                        icon: Image.asset(
                          'assets/icons/icon_category_2.png',
                          height: 24,
                        ),
                        backgroundColor: AppColors.categoryBackground2,
                        onTap: () {
                          // Navegar a categoría de almuerzos
                        },
                      ),
                      CategoryCard(
                        title: AppStrings.dinner,
                        icon: Image.asset(
                          'assets/icons/icon_category_3.png',
                          height: 24,
                        ),
                        backgroundColor: AppColors.categoryBackground3,
                        onTap: () {
                          // Navegar a categoría de cenas
                        },
                      ),
                      CategoryCard(
                        title: AppStrings.drinks,
                        icon: Image.asset(
                          'assets/icons/icon_category_4.png',
                          height: 24,
                        ),
                        backgroundColor: AppColors.categoryBackground4,
                        onTap: () {
                          // Navegar a categoría de bebidas
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSizes.spaceXL),

                // Sección de Productos destacados
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
                  child: Text(
                    AppStrings.featuredProducts,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w500, fontSize: 22),
                  ),
                ),

                const SizedBox(height: AppSizes.spaceM),

                // Lista horizontal de productos destacados
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
                    children: [
                      ProductCard(
                        imagePath: 'assets/images/food_sanwich_tripple.png',
                        name: AppStrings.tripleSandwich,
                        price: 'S/ 12.90',
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => ProductDetailsScreen()),
                          );
                        },
                      ),
                      const SizedBox(width: AppSizes.spaceXL),
                      ProductCard(
                        imagePath: 'assets/images/food_empanada.png',
                        name: AppStrings.chickenEmpanada,
                        price: 'S/ 6.50',
                        onTap: () {
                          // Navegar a detalle del producto
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => HistorialComprasScreen()),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: AppSizes.spaceXL),

                // Sección de Ofertas especiales (productos)
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
                  child: Text(
                    AppStrings.specialOffers,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w500,
                          fontSize: 22,
                        ),
                  ),
                ),

                const SizedBox(height: AppSizes.spaceM),

                // Lista horizontal de ofertas
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
                    children: [
                      ProductCard(
                        imagePath: 'assets/images/food_sanwich.png',
                        name: AppStrings.chickenCroissant,
                        price: 'S/ 8.90',
                        discount: AppStrings.discountLabel,
                        onTap: () {
                          // Navegar a detalle del producto
                        },
                      ),
                      const SizedBox(width: AppSizes.spaceM),
                      ProductCard(
                        imagePath: 'assets/images/food_agua.png',
                        name: AppStrings.ssrrSoda,
                        price: 'S/ 3.50',
                        discount: AppStrings.discountLabel,
                        onTap: () {
                          // Navegar a detalle del producto
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
}