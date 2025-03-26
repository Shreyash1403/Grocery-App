import 'package:flutter/material.dart';
import 'package:grocery_app/models/best_selling_model.dart';
import 'package:grocery_app/models/groceries_model.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/services/product_service.dart';

class ProductViewModel with ChangeNotifier {
  final ProductService _productService = ProductService();

  List<ProductModel> _products = [];
  List<BestSellingModel> _bestSelling = [];
  List<GroceriesModel> _groceries = [];
  bool _isLoading = false;

  List<ProductModel> get products => _products;
  List<BestSellingModel> get bestSelling => _bestSelling;
  List<GroceriesModel> get groceries => _groceries;
  bool get isLoading => _isLoading;

  /// Load all products
  Future<void> loadProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<ProductModel> existingProducts =
          await _productService.fetchProducts();

      if (existingProducts.isEmpty) {
        await _productService.addProducts();
        existingProducts = await _productService.fetchProducts();
      }

      _products = existingProducts;
    } catch (e) {
      debugPrint("Error loading products: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Load best-selling products
  Future<void> loadBestSellingProducts() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<BestSellingModel> existingBestSelling =
          await _productService.fetchBestSellingProducts();

      if (existingBestSelling.isEmpty) {
        debugPrint("Best-selling products missing, adding...");
        await _productService.addBestSellingProducts();
        existingBestSelling = await _productService.fetchBestSellingProducts();
      }

      _bestSelling = existingBestSelling;
    } catch (e) {
      debugPrint("Error loading best-selling products: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  /// Load groceries
  Future<void> loadGroceries() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<GroceriesModel> existingGroceries =
          await _productService.fetchGroceries();

      if (existingGroceries.isEmpty) {
        debugPrint("Groceries missing, adding...");
        await _productService.addGroceries();
        existingGroceries = await _productService.fetchGroceries();
      }

      _groceries = existingGroceries;
    } catch (e) {
      debugPrint("Error loading groceries: $e");
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
