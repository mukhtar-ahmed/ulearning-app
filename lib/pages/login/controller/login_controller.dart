import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ulearning_app/common/constant.dart';
import 'package:ulearning_app/common/loader/global_loader.dart';
import 'package:ulearning_app/main.dart';
import 'package:ulearning_app/pages/application/application.dart';
import 'package:ulearning_app/pages/global.dart';
import 'package:ulearning_app/pages/login/provider/login_notifire.dart';
import 'package:ulearning_app/pages/login/repo/login_repo.dart';
import 'package:ulearning_app/pages/login/user.dart';

class LoginController {
  LoginController();

  Future<void> handleLogin(WidgetRef ref) async {
    var state = ref.read(loginNotifireProvider);
    ref.read(globalLoaderProvider.notifier).changebool(true);
    try {
      UserCredential userCredential = await LoginRepo.firebaseLogin(
          state.emailController.text.trim(),
          state.passwordController.text.trim());

      if (userCredential.user != null) {
        Global.storageService.setString(
            Constant.USER_PROFILE,
            jsonEncode({
              'name': 'Mukhtar',
              'description': 'Hello I am there',
              'email': FirebaseAuth.instance.currentUser!.email
            }));
        Global.storageService.setString(Constant.USER_TOKEN, '1234');
        navKey.currentState?.pushAndRemoveUntil(
          MaterialPageRoute(builder: (_) => Application()),
          (route) => false,
        );
        ref.read(globalLoaderProvider.notifier).changebool(false);
      }
    } catch (e) {
      Fluttertoast.showToast(
        msg: 'Login failed. Please try again',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
      ref.read(globalLoaderProvider.notifier).changebool(false);
    }
  }
}
