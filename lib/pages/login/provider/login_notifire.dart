import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/login/view/login_state.dart';

class LoginNotifire extends StateNotifier<LoginPageState> {
  LoginNotifire()
      : super(LoginPageState(
            emailController: TextEditingController(),
            passwordController: TextEditingController(),
            formKey: GlobalKey<FormState>()));

  void dispose() {
    state.emailController.dispose();
    state.passwordController.dispose();
    super.dispose();
  }
}

final loginNotifireProvider =
    StateNotifierProvider<LoginNotifire, LoginPageState>(
        (ref) => LoginNotifire());
