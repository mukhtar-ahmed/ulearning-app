import 'package:flutter/material.dart';

class LoginPageState {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  LoginPageState({
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });
}
