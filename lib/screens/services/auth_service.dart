import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // 🔹 EMAIL LOGIN
  Future<User?> login({required String email, required String password}) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );
    return cred.user;
  }

  // 🔹 EMAIL SIGNUP
  Future<User?> signup({
    required String email,
    required String password,
    required String phone,
  }) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email.trim(),
      password: password.trim(),
    );

    await _firestore.collection("users").doc(cred.user!.uid).set({
      "email": email.trim(),
      "phone": phone.trim(),
      "provider": "password",
      "createdAt": Timestamp.now(),
    });

    return cred.user;
  }

  // 🔹 FORGOT PASSWORD
  Future<void> resetPassword(String email) async {
    await _auth.sendPasswordResetEmail(email: email.trim());
  }
}
