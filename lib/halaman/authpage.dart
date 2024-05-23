import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maxtrip/halaman/hal_login.dart';
import 'package:maxtrip/halaman/hal_utama.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // User is logged in
          if (snapshot.hasData) {
            return HalUtama();
          }
          // User is NOT logged in
          else {
            return HalLogin();
          }
        },
      ),
    );
  }
}
