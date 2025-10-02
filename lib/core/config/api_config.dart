class ApiConfig {
  // Base URL - Change this to your server IP address
  static const String baseUrl = 'http://zamalek.x10.network/food_delivery_api';
  
  // API Endpoints
  static const String login = '$baseUrl/auth/login.php';
  static const String register = '$baseUrl/auth/register.php';
  static const String logout = '$baseUrl/auth/logout.php';
  
  static const String getProducts = '$baseUrl/products/get_products.php';
  static const String getProductDetail = '$baseUrl/products/get_product_detail.php';
  static const String searchProducts = '$baseUrl/products/search_products.php';
  
  static const String getCategories = '$baseUrl/categories/get_categories.php';
  static const String getCategoryProducts = '$baseUrl/categories/get_category_products.php';
  
  static const String getUserProfile = '$baseUrl/user/get_profile.php';
  static const String updateProfile = '$baseUrl/user/update_profile.php';
  
  static const String getOrders = '$baseUrl/orders/get_orders.php';
  static const String createOrder = '$baseUrl/orders/create_order.php';
  static const String getOrderDetail = '$baseUrl/orders/get_order_detail.php';
  static const String cancelOrder = '$baseUrl/orders/cancel_order.php';
  
  static const String getAddresses = '$baseUrl/addresses/get_addresses.php';
  static const String addAddress = '$baseUrl/addresses/add_address.php';
  static const String updateAddress = '$baseUrl/addresses/update_address.php';
  static const String deleteAddress = '$baseUrl/addresses/delete_address.php';
  
  static const String getPaymentMethods = '$baseUrl/payment/get_payment_methods.php';
  static const String addPaymentMethod = '$baseUrl/payment/add_payment_method.php';
  static const String deletePaymentMethod = '$baseUrl/payment/delete_payment_method.php';
  
  static const String getNotifications = '$baseUrl/notifications/get_notifications.php';
  static const String markNotificationRead = '$baseUrl/notifications/mark_read.php';
  
  static const String addReview = '$baseUrl/reviews/add_review.php';
  static const String getReviews = '$baseUrl/reviews/get_reviews.php';
  
  // Request timeout
  static const Duration timeout = Duration(seconds: 30);
}