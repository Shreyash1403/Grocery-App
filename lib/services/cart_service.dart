import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:grocery_app/models/cart_model.dart';

class CartService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addToCart(String userId, CartItem item) async {
    final cartRef =
        _firestore.collection("users").doc(userId).collection("cart");
    await cartRef.doc(item.id).set(item.toMap());
  }

  Future<void> removeFromCart(String userId, String itemId) async {
    await _firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .doc(itemId)
        .delete();
  }

  Future<void> clearCart(String userId) async {
    final cartItems = await _firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .get();
    for (var doc in cartItems.docs) {
      await doc.reference.delete();
    }
  }

  Future<List<CartItem>> fetchCartItems(String userId) async {
    final snapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('cart')
        .get();
    return snapshot.docs.map((doc) => CartItem.fromMap(doc.data())).toList();
  }
}
