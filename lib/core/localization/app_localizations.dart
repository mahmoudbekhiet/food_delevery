import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'app_name': 'Food Delivery',
      'good_morning': 'Good Morning',
      'good_afternoon': 'Good Afternoon',
      'good_evening': 'Good Evening',
      'breakfast_time': "Rise And Shine! It's Breakfast Time",
      'lunch_time': "Time For Lunch!",
      'dinner_time': "Dinner Time!",
      'search': 'Search',
      'search_hint': 'Search for food...',
      'best_seller': 'Best Seller',
      'view_all': 'View All',
      'recommend': 'Recommend',
      'categories': 'Categories',
      'home': 'Home',
      'favorites': 'Favorites',
      'cart': 'Cart',
      'profile': 'Profile',
      'add_to_cart': 'Add to Cart',
      'checkout': 'Checkout',
      'my_orders': 'My Orders',
      'settings': 'Settings',
      'logout': 'Logout',
      'login': 'Log In',
      'signup': 'Sign Up',
      'email': 'Email',
      'password': 'Password',
      'welcome': 'Welcome',
      'get_started': 'Get Started',
      'language': 'Language',
      'dark_mode': 'Dark Mode',
      'light_mode': 'Light Mode',
      'notifications': 'Notifications',
      'delivery_address': 'Delivery Address',
      'payment_methods': 'Payment Methods',
      'help_faqs': 'Help & FAQs',
      'contact_us': 'Contact Us',
      'about': 'About',
      'total': 'Total',
      'subtotal': 'Subtotal',
      'delivery_fee': 'Delivery Fee',
      'order_confirmed': 'Order Confirmed!',
      'order_placed': 'Your order has been placed successfully',
      'track_order': 'Track Order',
      'back_to_home': 'Back to Home',
      'no_items_cart': 'Your cart is empty',
      'no_favorites': 'No favorites yet',
      'no_orders': 'No orders found',
      'active': 'Active',
      'completed': 'Completed',
      'canceled': 'Canceled',
      'snacks': 'Snacks',
      'meal': 'Meal',
      'vegan': 'Vegan',
      'dessert': 'Dessert',
      'drinks': 'Drinks',
      'promo_title': 'Experience our delicious new dish',
      'promo_discount': '30% OFF',
    },
    'ar': {
      'app_name': 'توصيل الطعام',
      'good_morning': 'صباح الخير',
      'good_afternoon': 'مساء الخير',
      'good_evening': 'مساء الخير',
      'breakfast_time': 'استيقظ وتألق! حان وقت الإفطار',
      'lunch_time': 'حان وقت الغداء!',
      'dinner_time': 'حان وقت العشاء!',
      'search': 'بحث',
      'search_hint': 'ابحث عن الطعام...',
      'best_seller': 'الأكثر مبيعاً',
      'view_all': 'عرض الكل',
      'recommend': 'موصى به',
      'categories': 'الفئات',
      'home': 'الرئيسية',
      'favorites': 'المفضلة',
      'cart': 'السلة',
      'profile': 'الملف الشخصي',
      'add_to_cart': 'أضف إلى السلة',
      'checkout': 'الدفع',
      'my_orders': 'طلباتي',
      'settings': 'الإعدادات',
      'logout': 'تسجيل الخروج',
      'login': 'تسجيل الدخول',
      'signup': 'إنشاء حساب',
      'email': 'البريد الإلكتروني',
      'password': 'كلمة المرور',
      'welcome': 'مرحباً',
      'get_started': 'ابدأ الآن',
      'language': 'اللغة',
      'dark_mode': 'الوضع الداكن',
      'light_mode': 'الوضع الفاتح',
      'notifications': 'الإشعارات',
      'delivery_address': 'عنوان التوصيل',
      'payment_methods': 'طرق الدفع',
      'help_faqs': 'المساعدة والأسئلة',
      'contact_us': 'اتصل بنا',
      'about': 'حول',
      'total': 'المجموع',
      'subtotal': 'المجموع الفرعي',
      'delivery_fee': 'رسوم التوصيل',
      'order_confirmed': 'تم تأكيد الطلب!',
      'order_placed': 'تم تقديم طلبك بنجاح',
      'track_order': 'تتبع الطلب',
      'back_to_home': 'العودة للرئيسية',
      'no_items_cart': 'سلتك فارغة',
      'no_favorites': 'لا توجد مفضلات',
      'no_orders': 'لا توجد طلبات',
      'active': 'نشط',
      'completed': 'مكتمل',
      'canceled': 'ملغي',
      'snacks': 'وجبات خفيفة',
      'meal': 'وجبة',
      'vegan': 'نباتي',
      'dessert': 'حلويات',
      'drinks': 'مشروبات',
      'promo_title': 'جرب طبقنا اللذيذ الجديد',
      'promo_discount': 'خصم 30%',
    },
    'de': {
      'app_name': 'Essenslieferung',
      'good_morning': 'Guten Morgen',
      'good_afternoon': 'Guten Tag',
      'good_evening': 'Guten Abend',
      'breakfast_time': 'Aufstehen und glänzen! Es ist Frühstückszeit',
      'lunch_time': 'Zeit zum Mittagessen!',
      'dinner_time': 'Abendessenszeit!',
      'search': 'Suchen',
      'search_hint': 'Nach Essen suchen...',
      'best_seller': 'Bestseller',
      'view_all': 'Alle anzeigen',
      'recommend': 'Empfehlen',
      'categories': 'Kategorien',
      'home': 'Startseite',
      'favorites': 'Favoriten',
      'cart': 'Warenkorb',
      'profile': 'Profil',
      'add_to_cart': 'In den Warenkorb',
      'checkout': 'Zur Kasse',
      'my_orders': 'Meine Bestellungen',
      'settings': 'Einstellungen',
      'logout': 'Abmelden',
      'login': 'Anmelden',
      'signup': 'Registrieren',
      'email': 'E-Mail',
      'password': 'Passwort',
      'welcome': 'Willkommen',
      'get_started': 'Loslegen',
      'language': 'Sprache',
      'dark_mode': 'Dunkler Modus',
      'light_mode': 'Heller Modus',
      'notifications': 'Benachrichtigungen',
      'delivery_address': 'Lieferadresse',
      'payment_methods': 'Zahlungsmethoden',
      'help_faqs': 'Hilfe & FAQs',
      'contact_us': 'Kontaktiere uns',
      'about': 'Über',
      'total': 'Gesamt',
      'subtotal': 'Zwischensumme',
      'delivery_fee': 'Liefergebühr',
      'order_confirmed': 'Bestellung bestätigt!',
      'order_placed': 'Ihre Bestellung wurde erfolgreich aufgegeben',
      'track_order': 'Bestellung verfolgen',
      'back_to_home': 'Zurück zur Startseite',
      'no_items_cart': 'Ihr Warenkorb ist leer',
      'no_favorites': 'Noch keine Favoriten',
      'no_orders': 'Keine Bestellungen gefunden',
      'active': 'Aktiv',
      'completed': 'Abgeschlossen',
      'canceled': 'Storniert',
      'snacks': 'Snacks',
      'meal': 'Mahlzeit',
      'vegan': 'Vegan',
      'dessert': 'Nachtisch',
      'drinks': 'Getränke',
      'promo_title': 'Erleben Sie unser köstliches neues Gericht',
      'promo_discount': '30% RABATT',
    },
    'fr': {
      'app_name': 'Livraison de nourriture',
      'good_morning': 'Bonjour',
      'good_afternoon': 'Bon après-midi',
      'good_evening': 'Bonsoir',
      'breakfast_time': "Levez-vous et brillez! C'est l'heure du petit-déjeuner",
      'lunch_time': "C'est l'heure du déjeuner!",
      'dinner_time': "C'est l'heure du dîner!",
      'search': 'Rechercher',
      'search_hint': 'Rechercher de la nourriture...',
      'best_seller': 'Meilleure vente',
      'view_all': 'Voir tout',
      'recommend': 'Recommander',
      'categories': 'Catégories',
      'home': 'Accueil',
      'favorites': 'Favoris',
      'cart': 'Panier',
      'profile': 'Profil',
      'add_to_cart': 'Ajouter au panier',
      'checkout': 'Commander',
      'my_orders': 'Mes commandes',
      'settings': 'Paramètres',
      'logout': 'Se déconnecter',
      'login': 'Se connecter',
      'signup': "S'inscrire",
      'email': 'E-mail',
      'password': 'Mot de passe',
      'welcome': 'Bienvenue',
      'get_started': 'Commencer',
      'language': 'Langue',
      'dark_mode': 'Mode sombre',
      'light_mode': 'Mode clair',
      'notifications': 'Notifications',
      'delivery_address': 'Adresse de livraison',
      'payment_methods': 'Modes de paiement',
      'help_faqs': 'Aide & FAQs',
      'contact_us': 'Contactez-nous',
      'about': 'À propos',
      'total': 'Total',
      'subtotal': 'Sous-total',
      'delivery_fee': 'Frais de livraison',
      'order_confirmed': 'Commande confirmée!',
      'order_placed': 'Votre commande a été passée avec succès',
      'track_order': 'Suivre la commande',
      'back_to_home': "Retour à l'accueil",
      'no_items_cart': 'Votre panier est vide',
      'no_favorites': 'Pas encore de favoris',
      'no_orders': 'Aucune commande trouvée',
      'active': 'Actif',
      'completed': 'Terminé',
      'canceled': 'Annulé',
      'snacks': 'Collations',
      'meal': 'Repas',
      'vegan': 'Végétalien',
      'dessert': 'Dessert',
      'drinks': 'Boissons',
      'promo_title': 'Découvrez notre nouveau plat délicieux',
      'promo_discount': '30% DE RÉDUCTION',
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? key;
  }

  String get appName => translate('app_name');
  String get goodMorning => translate('good_morning');
  String get goodAfternoon => translate('good_afternoon');
  String get goodEvening => translate('good_evening');
  String get breakfastTime => translate('breakfast_time');
  String get lunchTime => translate('lunch_time');
  String get dinnerTime => translate('dinner_time');
  String get search => translate('search');
  String get searchHint => translate('search_hint');
  String get bestSeller => translate('best_seller');
  String get viewAll => translate('view_all');
  String get recommend => translate('recommend');
  String get categories => translate('categories');
  String get home => translate('home');
  String get favorites => translate('favorites');
  String get cart => translate('cart');
  String get profile => translate('profile');
  String get addToCart => translate('add_to_cart');
  String get checkout => translate('checkout');
  String get myOrders => translate('my_orders');
  String get settings => translate('settings');
  String get logout => translate('logout');
  String get login => translate('login');
  String get signup => translate('signup');
  String get email => translate('email');
  String get password => translate('password');
  String get welcome => translate('welcome');
  String get getStarted => translate('get_started');
  String get language => translate('language');
  String get darkMode => translate('dark_mode');
  String get lightMode => translate('light_mode');
  String get notifications => translate('notifications');
  String get deliveryAddress => translate('delivery_address');
  String get paymentMethods => translate('payment_methods');
  String get helpFaqs => translate('help_faqs');
  String get contactUs => translate('contact_us');
  String get about => translate('about');
  String get total => translate('total');
  String get subtotal => translate('subtotal');
  String get deliveryFee => translate('delivery_fee');
  String get orderConfirmed => translate('order_confirmed');
  String get orderPlaced => translate('order_placed');
  String get trackOrder => translate('track_order');
  String get backToHome => translate('back_to_home');
  String get noItemsCart => translate('no_items_cart');
  String get noFavorites => translate('no_favorites');
  String get noOrders => translate('no_orders');
  String get active => translate('active');
  String get completed => translate('completed');
  String get canceled => translate('canceled');
  String get snacks => translate('snacks');
  String get meal => translate('meal');
  String get vegan => translate('vegan');
  String get dessert => translate('dessert');
  String get drinks => translate('drinks');
  String get promoTitle => translate('promo_title');
  String get promoDiscount => translate('promo_discount');
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar', 'de', 'fr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}