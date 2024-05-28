import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/pages/registration/view/register_state.dart';

class RegisterNotifier extends StateNotifier<RegisterPageState> {
  RegisterNotifier()
      : super(RegisterPageState(
          userNameController: TextEditingController(),
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
          rePasswordController: TextEditingController(),
          formKey: GlobalKey<FormState>(),
        ));

  void dispose() {
    state.userNameController.dispose();
    state.emailController.dispose();
    state.passwordController.dispose();
    state.rePasswordController.dispose();
    super.dispose();
  }
}

final registerNotifierProvider =
    StateNotifierProvider<RegisterNotifier, RegisterPageState>((ref) {
  return RegisterNotifier();
});
