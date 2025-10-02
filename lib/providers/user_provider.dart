import 'package:flutter/material.dart';
import '../models/address_model.dart';
import '../models/payment_method_model.dart';
import '../services/api_service.dart';

class UserProvider with ChangeNotifier {
  List<AddressModel> _addresses = [];
  List<PaymentMethodModel> _paymentMethods = [];
  bool _isLoading = false;

  List<AddressModel> get addresses => _addresses;
  List<PaymentMethodModel> get paymentMethods => _paymentMethods;
  bool get isLoading => _isLoading;

  AddressModel? get defaultAddress =>
      _addresses.firstWhere((a) => a.isDefault, orElse: () => _addresses.isNotEmpty ? _addresses.first : throw Exception('No address'));

  PaymentMethodModel? get defaultPaymentMethod =>
      _paymentMethods.firstWhere((p) => p.isDefault, orElse: () => _paymentMethods.isNotEmpty ? _paymentMethods.first : throw Exception('No payment method'));

  final ApiService _apiService = ApiService();

  Future<void> fetchAddresses() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.getAddresses();
      if (response['success']) {
        _addresses = (response['addresses'] as List)
            .map((json) => AddressModel.fromJson(json))
            .toList();
      }
    } catch (e) {
      debugPrint('Error fetching addresses: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> addAddress(Map<String, dynamic> addressData) async {
    try {
      final response = await _apiService.addAddress(addressData);
      if (response['success']) {
        await fetchAddresses();
        return true;
      }
    } catch (e) {
      debugPrint('Error adding address: $e');
    }
    return false;
  }

  Future<bool> deleteAddress(int addressId) async {
    try {
      final response = await _apiService.deleteAddress(addressId);
      if (response['success']) {
        await fetchAddresses();
        return true;
      }
    } catch (e) {
      debugPrint('Error deleting address: $e');
    }
    return false;
  }

  Future<void> fetchPaymentMethods() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.getPaymentMethods();
      if (response['success']) {
        _paymentMethods = (response['payment_methods'] as List)
            .map((json) => PaymentMethodModel.fromJson(json))
            .toList();
      }
    } catch (e) {
      debugPrint('Error fetching payment methods: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<bool> addPaymentMethod(Map<String, dynamic> paymentData) async {
    try {
      final response = await _apiService.addPaymentMethod(paymentData);
      if (response['success']) {
        await fetchPaymentMethods();
        return true;
      }
    } catch (e) {
      debugPrint('Error adding payment method: $e');
    }
    return false;
  }

  Future<bool> deletePaymentMethod(int paymentId) async {
    try {
      final response = await _apiService.deletePaymentMethod(paymentId);
      if (response['success']) {
        await fetchPaymentMethods();
        return true;
      }
    } catch (e) {
      debugPrint('Error deleting payment method: $e');
    }
    return false;
  }
}