import 'package:edupact/ui/authentication/login_page.dart';
import 'package:edupact/ui/authentication/signup_page.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleLoginRegister(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(onPressed: toggleLoginRegister);
    } else {
      return SignUpPage(onPressed: toggleLoginRegister);
    }
  }
}
