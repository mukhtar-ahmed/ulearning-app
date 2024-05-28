import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/loader/global_loader.dart';
import 'package:ulearning_app/pages/registration/controller/register_controller.dart';
import 'package:ulearning_app/pages/registration/provider/register_notifire.dart';
import 'package:ulearning_app/widget/rounded_button.dart';
import 'package:ulearning_app/widget/text_form_field_with_icon.dart';

class RegisterPage extends ConsumerStatefulWidget {
  static const String id = '/register_page';

  @override
  ConsumerState<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ConsumerState<RegisterPage> {
  late RegisterController _registerController;
  @override
  void initState() {
    _registerController = RegisterController(ref: ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final registerState = ref.watch(registerNotifierProvider);
    final loaderProvider = ref.watch(globalLoaderProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: registerState.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 20.0),
                Text("Enter Your details below"),
                SizedBox(height: 20.0),
                TextFormFieldWithIcon(
                  hintText: 'User Name',
                  icon: Icons.person,
                  controller: registerState.userNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your user name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20.0),
                TextFormFieldWithIcon(
                  hintText: 'Email',
                  icon: Icons.email,
                  controller: registerState.emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormFieldWithIcon(
                  hintText: 'Password',
                  icon: Icons.lock,
                  isPassword: true,
                  controller: registerState.passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                TextFormFieldWithIcon(
                  hintText: 'Re-enter Password',
                  icon: Icons.lock,
                  isPassword: true,
                  controller: registerState.rePasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please re-enter your password';
                    } else if (value != registerState.passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                loaderProvider
                    ? CircularProgressIndicator()
                    : RoundedButton(
                        text: 'Register',
                        color: Colors.white,
                        textColor: Colors.black,
                        borderColor: Colors.black,
                        onPressed: () {
                          if (registerState.formKey.currentState!.validate()) {
                            registerState.formKey.currentState!.save();
                            _registerController.handleRegister();
                            // If all validations pass, save the form

                            // Perform registration with collected data
                            // Here you can add your logic for registration
                          }
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
