import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/loader/global_loader.dart';
import 'package:ulearning_app/pages/registration/provider/register_notifire.dart';
import 'package:ulearning_app/pages/registration/repo/signup_repo.dart';

class RegisterController {
  final WidgetRef ref;

  RegisterController({required this.ref});

  Future<void> handleRegister() async {
    var state = ref.read(registerNotifierProvider);
    ref.read(globalLoaderProvider.notifier).changebool(true);

    UserCredential _userCredential = await SignupRepo.FirebaseSignup(
        email: state.emailController.text.trim(),
        password: state.passwordController.text.trim());

    if (_userCredential.user != null) {
      _userCredential.user!.sendEmailVerification();
      _userCredential.user!.updateDisplayName(state.userNameController.text);
      Navigator.pop(ref.context);
    }
    ref.read(globalLoaderProvider.notifier).changebool(false);
  }
}
