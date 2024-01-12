import 'package:edupact/ui/authentication/login_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common/styles.dart';
import '../../skeleton.dart';
import '../../widgets/custom_auth_textfield.dart';
import '../../widgets/custom_button.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
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
              CustomAuthTextField(hintText: 'username', controller: _usernameController),
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
              CustomAuthTextField(hintText: 'email', controller: _emailController),
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
              CustomAuthTextField(hintText: 'password', controller: _passwordController),
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
              CustomAuthTextField(hintText: 'password', controller: _confirmPasswordController),
              /*END*/

              const SizedBox(height: 24),
              CustomButton(
                label: 'Register',
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Skeleton()));
                },
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
                            recognizer: TapGestureRecognizer()..onTap = () =>
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()))
                        )
                      ]
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
