import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ulearning_app/common/loader/global_loader.dart';
import 'package:ulearning_app/pages/login/controller/login_controller.dart';
import 'package:ulearning_app/pages/login/provider/login_notifire.dart';

import '../../../widget/rounded_button.dart';
import '../../../widget/text_form_field_with_icon.dart';

class LoginPage extends ConsumerStatefulWidget {
  static const String id = '/login_page';

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  late LoginController _loginController;

  @override
  void didChangeDependencies() {
    _loginController = LoginController();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final loginRef = ref.watch(loginNotifireProvider);
    final loaderProvider = ref.watch(globalLoaderProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: loginRef.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialIconButton(
                      imagePath: 'assets/images/icons-google.png',
                    ),
                    SizedBox(width: 10.0),
                    SocialIconButton(
                      imagePath: 'assets/images/icons-twitter.png',
                    ),
                    SizedBox(width: 10.0),
                    SocialIconButton(
                      imagePath: 'assets/images/icons-facebook.png',
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text("or you want to login with your email"),
                SizedBox(height: 20.0),
                TextFormFieldWithIcon(
                  hintText: 'Email',
                  icon: Icons.email,
                  controller: loginRef.emailController,
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
                  controller: loginRef.passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                SizedBox(height: 20.0),
                loaderProvider
                    ? CircularProgressIndicator()
                    : RoundedButton(
                        text: 'Login',
                        color: Colors.blue,
                        onPressed: () {
                          if (loginRef.formKey.currentState!.validate()) {
                            // If all validations pass, save the form
                            loginRef.formKey.currentState!.save();
                            _loginController.handleLogin(ref);

                            // Perform login with _emailController.text and _passwordController.text
                            // Here you can add your logic for authentication
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

class SocialIconButton extends StatelessWidget {
  final String imagePath;

  SocialIconButton({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: ImageIcon(
        AssetImage(imagePath),
        size: 40.0,
        color: Colors.blue,
      ),
      onPressed: () {},
    );
  }
}
