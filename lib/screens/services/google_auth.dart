import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GoogleAuthService {
  static Future<User?> signInWithGoogle() async {
    final provider = GoogleAuthProvider();
    provider.addScope('email');
    provider.addScope('profile');

    final cred = await FirebaseAuth.instance.signInWithPopup(provider);

    final user = cred.user;
    if (user == null) return null;

    final doc = FirebaseFirestore.instance.collection("users").doc(user.uid);

    final snap = await doc.get();

    if (!snap.exists) {
      await doc.set({
        "email": user.email,
        "phone": null,
        "provider": "google",
        "createdAt": Timestamp.now(),
      });
    }

    return user;
  }
}
