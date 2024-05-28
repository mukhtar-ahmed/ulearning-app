import 'package:flutter/material.dart';

class RegisterPageState {
  final TextEditingController userNameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final GlobalKey<FormState> formKey;

  RegisterPageState({
    required this.userNameController,
    required this.emailController,
    required this.passwordController,
    required this.rePasswordController,
    required this.formKey,
  });
}
