import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maxtrip/halaman/hal_login.dart'; // Import HalLogin page

class HalUtama extends StatelessWidget {
  const HalUtama({Key? key}) : super(key: key);

  void signOutUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // After signing out, navigate back to the login screen (HalLogin)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => HalLogin()), // Navigate to HalLogin
      );
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () => signOutUser(context),
          ),
        ],
      ),
      body: Center(
        child: Text(
          user != null
              ? 'Berhasil Login sebagai: ${user.email}'
              : 'User belum login',
        ),
      ),
    );
  }
}
