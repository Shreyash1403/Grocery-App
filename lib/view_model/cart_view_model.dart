import 'package:flutter/material.dart';
import 'package:grocery_app/models/cart_model.dart';

import '../services/cart_service.dart';

class CartViewModel extends ChangeNotifier {
  final Map<String, CartItem> _items = {};
  final CartService _cartService = CartService();

  Map<String, CartItem> get items => _items;

  Future<void> addToCart(String userId, CartItem item) async {
    if (_items.containsKey(item.id)) {
      _items.update(
        item.id,
        (existingItem) => CartItem(
          id: existingItem.id,
          name: existingItem.name,
          imageUrl: existingItem.imageUrl,
          price: existingItem.price,
          volume: existingItem.volume,
          quantity: existingItem.quantity + 1,
        ),
      );
    } else {
      _items[item.id] = item;
    }

    await _cartService.addToCart(userId, _items[item.id]!);
    notifyListeners();
  }

  Future<void> loadCart(String userId) async {
    final fetchedItems = await _cartService.fetchCartItems(userId);
    _items.clear();
    for (var item in fetchedItems) {
      _items[item.id] = item;
    }
    notifyListeners();
  }

  Future<void> removeItem(String userId, String id) async {
    _items.remove(id);
    await _cartService.removeFromCart(userId, id);
    notifyListeners();
  }

  Future<void> clearCart(String userId) async {
    _items.clear();
    await _cartService.clearCart(userId);
    notifyListeners();
  }

  double get totalAmount =>
      _items.values.fold(0.0, (sum, item) => sum + item.price * item.quantity);

  int get itemCount => _items.length;
}
