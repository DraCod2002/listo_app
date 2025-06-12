import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listo_app/presentation/screens/history/history_compras.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../../core/constants/app_strings.dart';
import '../../widgets/cards/category_card.dart';
import '../../widgets/cards/product_card.dart';
import '../../widgets/forms/custom_primax_lovers_buttom.dart';
import '../product-details/product_details_screen.dart';

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
                padding: const EdgeInsets.all(3.0), // AppSizes.paddingXS
                child: Row(
                  children: [
                    const Spacer(),
                    Image.asset(
                      'assets/images/listo_logo_home.png',
                      height: 45,
                    ),
                    const Spacer(), // AppSizes.iconM
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
                // Sección de Categorías
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSizes.paddingL),
                  child: Text(
                    AppStrings.categories,
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 22),
                  ),
                ),
                const SizedBox(height: AppSizes.spaceM),
                // Grid de categorías
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppSizes.paddingM),
                  child: GridView.count(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
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
                          context.push('/break-fast');

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
                          context.push('/lunch-fast');
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
                          context.push('/break-fast');
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
                          context.push('/lunch-fast');
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
                        ?.copyWith(fontWeight: FontWeight.w700, fontSize: 22),
                  ),
                ),

                const SizedBox(height: AppSizes.spaceM),

                // Lista horizontal de productos destacados
                SizedBox(
                  height: 200,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.paddingL),
                    children: [
                      ProductCard(
                        imagePath: 'assets/images/food_sanwich_tripple.png',
                        name: AppStrings.tripleSandwich,
                        price: 'S/ 12.90',
                        onTap: () {
                          context.push('/product-detail');
                        },
                      ),
                      const SizedBox(width: AppSizes.spaceXL),
                      ProductCard(
                        imagePath: 'assets/images/food_empanada.png',
                        name: AppStrings.chickenEmpanada,
                        price: 'S/ 6.50',
                        onTap: () {
                          // Navegar a detalle del producto
                          context.push('/product-detail');
                        },
                      ),
                      const SizedBox(width: AppSizes.spaceXL),
                      ProductCard(
                        imagePath: 'assets/images/food_sanwich_tripple.png',
                        name: AppStrings.tripleSandwich,
                        price: 'S/ 12.90',
                        onTap: () {
                          context.push('/product-detail');
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
                          fontWeight: FontWeight.w700,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.paddingL),
                    children: [
                      ProductCard(
                        imagePath: 'assets/images/food_sanwich.png',
                        name: AppStrings.chickenCroissant,
                        price: 'S/ 8.90',
                        discount: AppStrings.discountLabel,
                        onTap: () {
                          context.push('/product-detail');
                        },
                      ),
                      const SizedBox(width: AppSizes.spaceM),
                      ProductCard(
                        imagePath: 'assets/images/food_agua.png',
                        name: AppStrings.ssrrSoda,
                        price: 'S/ 3.50',
                        discount: AppStrings.discountLabel,
                        onTap: () {
                          context.push('/product-detail');
                        },
                      ),
                      const SizedBox(width: AppSizes.spaceM),
                      ProductCard(
                        imagePath: 'assets/images/food_sanwich.png',
                        name: AppStrings.chickenCroissant,
                        price: 'S/ 8.90',
                        discount: AppStrings.discountLabel,
                        onTap: () {
                          context.push('/product-detail');
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),

      // FloatingActionButton centrado
      floatingActionButton: PrimaxLoversButton(
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
