import 'package:edupact/skeleton.dart';
import 'package:edupact/ui/authentication/signup_page.dart';
import 'package:edupact/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../common/styles.dart';
import '../../widgets/custom_auth_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
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
              CustomAuthTextField(hintText: 'email', controller: _emailController),
              const SizedBox(height: 24.0),
              const Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 10),
              CustomAuthTextField(hintText: 'password', controller: _passwordController),
              const SizedBox(height: 16),
              const Align(
                alignment: AlignmentDirectional.centerEnd,
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                label: 'Login',
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
                        recognizer: TapGestureRecognizer()..onTap = () =>
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()))
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


