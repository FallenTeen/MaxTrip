import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maxtrip/halaman/hal_login.dart';
import 'package:maxtrip/halaman/mainpage.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // User is logged in
        if (snapshot.hasData && snapshot.data != null) {
          return MainPage();
        }
        // User is NOT logged in
        else {
          return HalLogin();
        }
      },
    );
  }
}
