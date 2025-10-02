import 'package:flutter/material.dart';
import '../../screens/splash/splash_screen.dart';
import '../../screens/welcome/welcome_screen.dart';
import '../../screens/onboarding/onboarding_screen.dart';
import '../../screens/auth/login_screen.dart';
import '../../screens/auth/signup_screen.dart';
import '../../screens/auth/set_password_screen.dart';
import '../../screens/auth/fingerprint_screen.dart';
import '../../screens/home/home_screen.dart';
import '../../screens/home/main_screen.dart';
import '../../screens/product/product_detail_screen.dart';
import '../../screens/cart/cart_screen.dart';
import '../../screens/checkout/checkout_screen.dart';
import '../../screens/payment/payment_screen.dart';
import '../../screens/order/order_confirmed_screen.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/profile/my_orders_screen.dart';
import '../../screens/profile/order_detail_screen.dart';
import '../../screens/profile/my_profile_screen.dart';
import '../../screens/profile/delivery_address_screen.dart';
import '../../screens/profile/add_address_screen.dart';
import '../../screens/profile/payment_methods_screen.dart';
import '../../screens/profile/add_card_screen.dart';
import '../../screens/profile/contact_us_screen.dart';
import '../../screens/profile/help_faqs_screen.dart';
import '../../screens/profile/settings_screen.dart';
import '../../screens/profile/notification_settings_screen.dart';
import '../../screens/notification/notification_screen.dart';
import '../../screens/category/category_screen.dart';
import '../../screens/favorites/favorites_screen.dart';

class AppRoutes {
  static const String splash = '/';
  static const String welcome = '/welcome';
  static const String onboarding = '/onboarding';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String setPassword = '/set-password';
  static const String fingerprint = '/fingerprint';
  static const String home = '/home';
  static const String main = '/main';
  static const String productDetail = '/product-detail';
  static const String cart = '/cart';
  static const String checkout = '/checkout';
  static const String payment = '/payment';
  static const String orderConfirmed = '/order-confirmed';
  static const String profile = '/profile';
  static const String myOrders = '/my-orders';
  static const String orderDetail = '/order-detail';
  static const String myProfile = '/my-profile';
  static const String deliveryAddress = '/delivery-address';
  static const String addAddress = '/add-address';
  static const String paymentMethods = '/payment-methods';
  static const String addCard = '/add-card';
  static const String contactUs = '/contact-us';
  static const String helpFaqs = '/help-faqs';
  static const String settings = '/settings';
  static const String notificationSettings = '/notification-settings';
  static const String notifications = '/notifications';
  static const String category = '/category';
  static const String favorites = '/favorites';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case AppRoutes.onboarding:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case AppRoutes.setPassword:
        return MaterialPageRoute(builder: (_) => const SetPasswordScreen());
      case AppRoutes.fingerprint:
        return MaterialPageRoute(builder: (_) => const FingerprintScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppRoutes.main:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case AppRoutes.productDetail:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => ProductDetailScreen(product: args['product']),
        );
      case AppRoutes.cart:
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case AppRoutes.checkout:
        return MaterialPageRoute(builder: (_) => const CheckoutScreen());
      case AppRoutes.payment:
        return MaterialPageRoute(builder: (_) => const PaymentScreen());
      case AppRoutes.orderConfirmed:
        return MaterialPageRoute(builder: (_) => const OrderConfirmedScreen());
      case AppRoutes.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case AppRoutes.myOrders:
        return MaterialPageRoute(builder: (_) => const MyOrdersScreen());
      case AppRoutes.orderDetail:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => OrderDetailScreen(order: args['order']),
        );
      case AppRoutes.myProfile:
        return MaterialPageRoute(builder: (_) => const MyProfileScreen());
      case AppRoutes.deliveryAddress:
        return MaterialPageRoute(builder: (_) => const DeliveryAddressScreen());
      case AppRoutes.addAddress:
        return MaterialPageRoute(builder: (_) => const AddAddressScreen());
      case AppRoutes.paymentMethods:
        return MaterialPageRoute(builder: (_) => const PaymentMethodsScreen());
      case AppRoutes.addCard:
        return MaterialPageRoute(builder: (_) => const AddCardScreen());
      case AppRoutes.contactUs:
        return MaterialPageRoute(builder: (_) => const ContactUsScreen());
      case AppRoutes.helpFaqs:
        return MaterialPageRoute(builder: (_) => const HelpFaqsScreen());
      case AppRoutes.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case AppRoutes.notificationSettings:
        return MaterialPageRoute(builder: (_) => const NotificationSettingsScreen());
      case AppRoutes.notifications:
        return MaterialPageRoute(builder: (_) => const NotificationScreen());
      case AppRoutes.category:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (_) => CategoryScreen(category: args['category']),
        );
      case AppRoutes.favorites:
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}