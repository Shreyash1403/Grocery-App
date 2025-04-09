import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // 🔐 Login
  Future<User?> login(String email, String password) async {
    final result = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  // 🆕 Signup
  Future<User?> signUp(String email, String password) async {
    final result = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  // 🚪 Logout
  Future<void> logout() async {
    await _auth.signOut();
  }

  // 📦 Get current user
  User? get currentUser => _auth.currentUser;
}
