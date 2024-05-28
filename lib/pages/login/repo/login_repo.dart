import 'package:firebase_auth/firebase_auth.dart';

class LoginRepo {
  static Future<UserCredential> firebaseLogin(
      String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
