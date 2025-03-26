import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:grocery_app/models/best_selling_model.dart';
import 'package:grocery_app/models/groceries_model.dart';
import 'package:grocery_app/models/product_model.dart';

class ProductService {
  final CollectionReference _productCollection =
      FirebaseFirestore.instance.collection("products");

  final CollectionReference _bestSellingCollection =
      FirebaseFirestore.instance.collection("best_selling");

  final CollectionReference _groceriesCollection =
      FirebaseFirestore.instance.collection("groceries");

  /// Add hardcoded products to Firestore
  Future<void> addProducts() async {
    List<ProductModel> hardcodedProducts = [
      ProductModel(
          id: "1",
          name: "Organic Bananas",
          imageUrl: "assets/banana.png",
          price: 60.0,
          category: "Fruits",
          unit: "7pcs, Priceg",
          description:
              "Banana are nutritious. Banana may be good for weight loss. Banana may be good for your heart. As part of a healthy and varied diet."),
      ProductModel(
          id: "2",
          name: "Red Apple",
          imageUrl: "assets/apple_home.png",
          price: 80.0,
          category: "Fruits",
          unit: "1kg, Priceg",
          description:
              "Apples are nutritious. Apples may be good for weight loss. Apples may be good for your heart. As part of a healthy and varied diet."),
    ];
    for (var product in hardcodedProducts) {
      await _productCollection.doc(product.id).set(product.toMap());
    }
  }

  /// Fetch products from Firestore
  Future<List<ProductModel>> fetchProducts() async {
    try {
      QuerySnapshot snapshot = await _productCollection.get();
      return snapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      debugPrint("Error fetching products: $e");
      return [];
    }
  }

  /// Add best-selling products if missing
  Future<void> addBestSellingProducts() async {
    try {
      List<BestSellingModel> dummyBestSelling = [
        BestSellingModel(
            id: "1",
            name: "Red Chilli",
            price: 150,
            imageUrl: "assets/chilli.png",
            description: "Honey is money"),
        BestSellingModel(
            id: "2",
            name: "Ginger",
            price: 500,
            imageUrl: "assets/ginger.png",
            description: "Ginger keeps healtly"),
      ];

      for (var product in dummyBestSelling) {
        await _bestSellingCollection.doc(product.id).set(product.toJson());
      }

      debugPrint("Best-selling products added!");
    } catch (e) {
      debugPrint("Error adding best-selling products: $e");
    }
  }

  /// Fetch best-selling products
  Future<List<BestSellingModel>> fetchBestSellingProducts() async {
    try {
      QuerySnapshot snapshot = await _bestSellingCollection.get();
      return snapshot.docs.map((doc) {
        return BestSellingModel.fromJson(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      debugPrint("Error fetching best-selling products: $e");
      return [];
    }
  }

  /// Add grocery products if missing
  Future<void> addGroceries() async {
    try {
      List<GroceriesModel> dummyGroceries = [
        GroceriesModel(
            id: "1",
            name: "Rice",
            price: 200,
            imageUrl: "assets/rice.png",
            description: "Rice is most grown in rainy areas"),
        GroceriesModel(
            id: "2",
            name: "Boiled Chicken",
            price: 180,
            imageUrl: "assets/chicken.png",
            description: "Wheat is the main course of enerdy"),
      ];

      for (var grocery in dummyGroceries) {
        await _groceriesCollection.doc(grocery.id).set(grocery.toJson());
      }

      debugPrint("Groceries added!");
    } catch (e) {
      debugPrint("Error adding groceries: $e");
    }
  }

  /// Fetch groceries from Firestore
  Future<List<GroceriesModel>> fetchGroceries() async {
    try {
      QuerySnapshot snapshot = await _groceriesCollection.get();
      return snapshot.docs.map((doc) {
        return GroceriesModel.fromJson(
            doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    } catch (e) {
      debugPrint("Error fetching groceries: $e");
      return [];
    }
  }
}
