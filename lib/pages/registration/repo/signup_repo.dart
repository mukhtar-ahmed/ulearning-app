import 'package:firebase_auth/firebase_auth.dart';

class SignupRepo {
  static Future<UserCredential> FirebaseSignup(
      {required String email, required String password}) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    return await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }
}
