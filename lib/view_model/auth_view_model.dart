import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/auth_service.dart';

class AuthViewModel extends ChangeNotifier {
  final AuthService _authService = AuthService();

  User? user;
  bool isLoading = false;

  // ✅ Login
  Future<void> login(String email, String password) async {
    isLoading = true;
    notifyListeners();

    try {
      user = await _authService.login(email, password);
    } catch (e) {
      print("Login error: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  // ✅ Signup (also saves user profile to Firestore)
  Future<void> signUp(String email, String password, String name) async {
    isLoading = true;
    notifyListeners();

    try {
      print("Attempting to create user...");
      user = await _authService.signUp(email, password);
      print("User created: ${user?.uid}");

      if (user != null) {
        await FirebaseFirestore.instance
            .collection("users")
            .doc(user!.uid)
            .set({
          "name": name,
          "email": email,
        });
        print("User data saved to Firestore.");
      }
    } catch (e) {
      print("Signup error: $e");
    }

    isLoading = false;
    notifyListeners();
  }

  // ✅ Logout
  Future<void> logout() async {
    await _authService.logout();
    user = null;
    notifyListeners();
  }

  // ✅ Auto login check (for splash screen)
  void checkLoginStatus() {
    user = _authService.currentUser;
    notifyListeners();
  }
}
