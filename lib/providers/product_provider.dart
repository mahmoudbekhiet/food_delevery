import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../models/category_model.dart';
import '../services/api_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];
  List<ProductModel> _bestSellers = [];
  List<ProductModel> _recommendations = [];
  List<CategoryModel> _categories = [];
  bool _isLoading = false;

  List<ProductModel> get products => _products;
  List<ProductModel> get bestSellers => _bestSellers;
  List<ProductModel> get recommendations => _recommendations;
  List<CategoryModel> get categories => _categories;
  bool get isLoading => _isLoading;

  final ApiService _apiService = ApiService();

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _apiService.getProducts();
      if (response['success']) {
        _products = (response['products'] as List)
            .map((json) => ProductModel.fromJson(json))
            .toList();
        
        _bestSellers = _products.where((p) => p.rating >= 4.5).take(10).toList();
        _recommendations = _products.take(10).toList();
      }
    } catch (e) {
      debugPrint('Error fetching products: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchCategories() async {
    try {
      final response = await _apiService.getCategories();
      if (response['success']) {
        _categories = (response['categories'] as List)
            .map((json) => CategoryModel.fromJson(json))
            .toList();
        notifyListeners();
      }
    } catch (e) {
      debugPrint('Error fetching categories: $e');
    }
  }

  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      final response = await _apiService.searchProducts(query);
      if (response['success']) {
        return (response['products'] as List)
            .map((json) => ProductModel.fromJson(json))
            .toList();
      }
    } catch (e) {
      debugPrint('Error searching products: $e');
    }
    return [];
  }

  Future<List<ProductModel>> getProductsByCategory(int categoryId) async {
    try {
      final response = await _apiService.getCategoryProducts(categoryId);
      if (response['success']) {
        return (response['products'] as List)
            .map((json) => ProductModel.fromJson(json))
            .toList();
      }
    } catch (e) {
      debugPrint('Error fetching category products: $e');
    }
    return [];
  }

  void toggleFavorite(int productId) {
    final index = _products.indexWhere((p) => p.id == productId);
    if (index >= 0) {
      _products[index] = _products[index].copyWith(
        isFavorite: !_products[index].isFavorite,
      );
      notifyListeners();
    }
  }
}