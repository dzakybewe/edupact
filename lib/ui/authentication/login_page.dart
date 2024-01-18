import 'package:edupact/firebase/auth.dart';
import 'package:edupact/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common/styles.dart';
import '../../widgets/custom_auth_textfield.dart';
import '../../widgets/support_widgets.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onPressed;
  const LoginPage({super.key, required this.onPressed});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  bool isLogin = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      if (context.mounted) {
        if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
          return displayPopupMessage('Please fill in the blanks first', context);
        }
      }
      await Auth().signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        if (e.message == 'The supplied auth credential is incorrect, malformed or has expired.'){
          return displayPopupMessage('Invalid email/password', context);
        }
        return displayPopupMessage(e.message!, context);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 30
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  const Text(
                    'Email',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomAuthTextField(
                    hintText: 'email',
                    controller: _emailController,
                    isPassword: false,
                  ),
                  const SizedBox(height: 24.0),
                  const Text(
                    'Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomAuthTextField(
                    hintText: 'password',
                    controller: _passwordController,
                    isPassword: true,
                  ),
                  const SizedBox(height: 16),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: GestureDetector(
                      onTap: () => snackBarFeatureNotAvailable(context),
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  CustomButton(
                    label: 'Login',
                    onPressed: signInWithEmailAndPassword
                  ),
                  const SizedBox(height: 24,),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16
                        ),
                        children: [
                          const TextSpan(
                            text: 'Don\'t have an account?',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: ' Sign Up',
                            style: const TextStyle(
                              color: primaryColor,
                            ),
                            recognizer: TapGestureRecognizer()..onTap = widget.onPressed
                          )
                        ]
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


