import 'package:edupact/firebase/auth.dart';
import 'package:edupact/skeleton.dart';
import 'package:edupact/ui/authentication/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HasCredentialPage extends StatefulWidget {
  const HasCredentialPage({super.key});

  @override
  State<HasCredentialPage> createState() => _HasCredentialPageState();
}

class _HasCredentialPageState extends State<HasCredentialPage> {

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const Skeleton();
        } else {
          return const AuthPage();
        }
      },
    );
  }
}
