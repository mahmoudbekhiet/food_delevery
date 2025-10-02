import 'package:flutter/material.dart';
import '../models/order_model.dart';
import '../services/api_service.dart';

class OrderProvider with ChangeNotifier {
  List<OrderModel> _orders = [];
  bool _isLoading = false;

  List<OrderModel> get orders => _orders;
  bool get isLoading => _isLoading;

  List<OrderModel> get activeOrders =>
      _orders.where((o) => o.status == 'pending' || o.status == 'processing').toList();

  List<OrderModel> get completedOrders =>
      _orders.where((o) => o.status == 'completed').toList();

  List<OrderModel> get canceledOrders =>
      _orders.where((o) => o.status == 'canceled').toList();

  final ApiService _apiService = ApiService();

  Future<void> fetchOrders() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.getOrders();
      if (response['success']) {
        _orders = (response['orders'] as List)
            .map((json) => OrderModel.fromJson(json))
            .toList();
      }
    } catch (e) {
      debugPrint('Error fetching orders: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> createOrder(Map<String, dynamic> orderData) async {
    try {
      final response = await _apiService.createOrder(orderData);
      if (response['success']) {
        await fetchOrders();
        return true;
      }
    } catch (e) {
      debugPrint('Error creating order: $e');
    }
    return false;
  }

  Future<bool> cancelOrder(int orderId) async {
    try {
      final response = await _apiService.cancelOrder(orderId);
      if (response['success']) {
        await fetchOrders();
        return true;
      }
    } catch (e) {
      debugPrint('Error canceling order: $e');
    }
    return false;
  }
}