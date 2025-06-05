import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_sizes.dart';
import '../../../../core/constants/app_strings.dart';

class SpecialOffersCarousel extends StatefulWidget {
  const SpecialOffersCarousel({super.key});

  @override
  State<SpecialOffersCarousel> createState() => _SpecialOffersCarouselState();
}

class _SpecialOffersCarouselState extends State<SpecialOffersCarousel> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OfferItem> _offers = [
    OfferItem(
      title: AppStrings.specialOffers,
      subtitle: AppStrings.takeAdvantageDiscounts,
      imagePath: null, // Aquí irían las imágenes reales
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 140,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: _offers.length,
            itemBuilder: (context, index) {
              final offer = _offers[index];
              return Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: AppSizes.paddingXS),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.primaryDark],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(AppSizes.radiusM),
                ),
                child: Stack(
                  children: [
                    // Contenido del texto
                    Positioned(
                      left: AppSizes.paddingL,
                      top: AppSizes.paddingL,
                      right: 140, // Espacio para la imagen
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            offer.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                          ),
                          const SizedBox(height: AppSizes.spaceXS),
                          Text(
                            offer.subtitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: AppColors.white,
                                  fontSize: 18
                                ),
                          ),
                        ],
                      ),
                    ),

                    // Placeholder para imagen del producto
                    Positioned(
                      right: AppSizes.paddingXS,
                      top: AppSizes.paddingM,
                      bottom: AppSizes.paddingM,
                      child: Image.asset(
                        'assets/images/food_sanwich.png',
                        height: 45,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        // Indicadores de página
        if (_offers.length > 1) ...[
          const SizedBox(height: AppSizes.spaceM),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _offers.length,
              (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentPage == index
                      ? AppColors.primary
                      : AppColors.grey300,
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}

class OfferItem {
  final String title;
  final String subtitle;
  final String? imagePath;

  OfferItem({
    required this.title,
    required this.subtitle,
    this.imagePath,
  });
}
