import 'package:go_router/go_router.dart';
import 'package:listo_app/presentation/screens/HomeView.dart';
import 'package:listo_app/presentation/screens/cart/apple_pay_screen.dart';
import 'package:listo_app/presentation/screens/category-food/lunch_fast_screen.dart';
import 'package:listo_app/presentation/screens/history/history_compras.dart';
import 'package:listo_app/presentation/screens/notifications/details_screen.dart';
import 'package:listo_app/presentation/screens/notifications/notifications_screen.dart';
import 'package:listo_app/presentation/screens/onboarding/preferences_screen.dart';
import 'package:listo_app/presentation/screens/order/order_confirmation_screen.dart';
import 'package:listo_app/presentation/screens/product-details/product_details_screen.dart';

import '../../presentation/screens/category-food/breack_fast_screen.dart';

final appRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const PreferencesScreen(),
  ),
  GoRoute(
    path: '/home-view',
    builder: (context, state) {
      final initialIndex = state.extra as int? ?? 0;
      return HomeView(initialIndex: initialIndex);
    },
  ),
  GoRoute(
    path: '/push-details/:messageId',
    builder: (context, state) => DetailsScreen(
      pushMessageId: state.params['messageId'] ?? '',
    ),
  ),
  GoRoute(
    path: '/break-fast',
    builder: (context, state) => BreakfastScreen(
    ),
  ),
  GoRoute(
    path: '/lunch-fast',
    builder: (context, state) => LunchScreen(
    ),
  ),
  GoRoute(
    path: '/product-detail',
    builder: (context, state) => ProductDetailsScreen(),
  ),
  GoRoute(
    path: '/order-confirmation',
    builder: (context, state) => OrderConfirmationScreen(),
  ),
  GoRoute(
    path: '/apple-pay',
    builder: (context, state) => ApplePayScreen(),
  ),
  GoRoute(
    path: '/history_compras',
    builder: (context, state) => HistorialComprasScreen(),
  ),
]);
