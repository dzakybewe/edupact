import 'package:edupact/firebase/auth.dart';
import 'package:edupact/firebase/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../common/styles.dart';
import '../../widgets/custom_auth_textfield.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/support_widgets.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onPressed;
  const SignUpPage({super.key, required this.onPressed});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  Future<void> createUserWithEmailAndPassword() async {
    try {
      if (context.mounted) {
        if (_usernameController.text.isEmpty || _emailController.text.isEmpty ||
            _passwordController.text.isEmpty) {
          return displayPopupMessage('Please fill in the blanks', context);
        }
        if (_passwordController.text != _confirmPasswordController.text) {
          return displayPopupMessage('Passwords don\'t match', context);
        }
      }

      UserCredential userCredential = await Auth().createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text
      );
      Database().addNewUserToDb(
          userCredential,
          _usernameController.text
      );
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        if (e.message ==
            'The email address is already in use by another account.') {
          return displayPopupMessage(
              'Email address has already been used', context);
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
                      'Sign Up',
                      style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  /*USERNAME TEXTFIELD*/
                  const Text(
                    'Username',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomAuthTextField(
                    hintText: 'username',
                    controller: _usernameController,
                    isPassword: false,
                  ),
                  /*END*/

                  const SizedBox(height: 24.0),

                  /*EMAIL TEXTFIELD*/
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
                  /*END*/

                  const SizedBox(height: 24.0),

                  /*PASSWORD TEXTFIELD*/
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
                  /*END*/

                  const SizedBox(height: 24.0),

                  /*CONFIRM PASSWORD TEXTFIELD*/
                  const Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomAuthTextField(
                    hintText: 'password',
                    controller: _confirmPasswordController,
                    isPassword: true,
                  ),
                  /*END*/

                  const SizedBox(height: 24),
                  CustomButton(
                    label: 'Register',
                    onPressed: createUserWithEmailAndPassword
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
                              text: 'Already have an account?',
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                                text: ' Login',
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
