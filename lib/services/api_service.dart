import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/config/api_config.dart';

class ApiService {
  Future<Map<String, dynamic>> _makeRequest(
    String url,
    Map<String, dynamic> body,
  ) async {
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(body),
      ).timeout(ApiConfig.timeout);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'success': false, 'message': 'Server error'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  Future<Map<String, dynamic>> _makeGetRequest(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
      ).timeout(ApiConfig.timeout);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {'success': false, 'message': 'Server error'};
      }
    } catch (e) {
      return {'success': false, 'message': 'Network error: $e'};
    }
  }

  // Auth APIs
  Future<Map<String, dynamic>> login(String email, String password) async {
    return await _makeRequest(ApiConfig.login, {
      'email': email,
      'password': password,
    });
  }

  Future<Map<String, dynamic>> register(String name, String email, String password) async {
    return await _makeRequest(ApiConfig.register, {
      'name': name,
      'email': email,
      'password': password,
    });
  }

  // Product APIs
  Future<Map<String, dynamic>> getProducts() async {
    return await _makeGetRequest(ApiConfig.getProducts);
  }

  Future<Map<String, dynamic>> searchProducts(String query) async {
    return await _makeGetRequest('${ApiConfig.searchProducts}?query=$query');
  }

  Future<Map<String, dynamic>> getCategoryProducts(int categoryId) async {
    return await _makeGetRequest('${ApiConfig.getCategoryProducts}?category_id=$categoryId');
  }

  // Category APIs
  Future<Map<String, dynamic>> getCategories() async {
    return await _makeGetRequest(ApiConfig.getCategories);
  }

  // Order APIs
  Future<Map<String, dynamic>> getOrders() async {
    return await _makeGetRequest(ApiConfig.getOrders);
  }

  Future<Map<String, dynamic>> createOrder(Map<String, dynamic> orderData) async {
    return await _makeRequest(ApiConfig.createOrder, orderData);
  }

  Future<Map<String, dynamic>> cancelOrder(int orderId) async {
    return await _makeRequest(ApiConfig.cancelOrder, {'order_id': orderId});
  }

  // Address APIs
  Future<Map<String, dynamic>> getAddresses() async {
    return await _makeGetRequest(ApiConfig.getAddresses);
  }

  Future<Map<String, dynamic>> addAddress(Map<String, dynamic> addressData) async {
    return await _makeRequest(ApiConfig.addAddress, addressData);
  }

  Future<Map<String, dynamic>> deleteAddress(int addressId) async {
    return await _makeRequest(ApiConfig.deleteAddress, {'address_id': addressId});
  }

  // Payment APIs
  Future<Map<String, dynamic>> getPaymentMethods() async {
    return await _makeGetRequest(ApiConfig.getPaymentMethods);
  }

  Future<Map<String, dynamic>> addPaymentMethod(Map<String, dynamic> paymentData) async {
    return await _makeRequest(ApiConfig.addPaymentMethod, paymentData);
  }

  Future<Map<String, dynamic>> deletePaymentMethod(int paymentId) async {
    return await _makeRequest(ApiConfig.deletePaymentMethod, {'payment_id': paymentId});
  }

  // User APIs
  Future<Map<String, dynamic>> getUserProfile() async {
    return await _makeGetRequest(ApiConfig.getUserProfile);
  }

  Future<Map<String, dynamic>> updateProfile(Map<String, dynamic> profileData) async {
    return await _makeRequest(ApiConfig.updateProfile, profileData);
  }
}