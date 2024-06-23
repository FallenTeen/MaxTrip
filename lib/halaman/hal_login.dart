import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maxtrip/components/loginbutton.dart';
import 'package:maxtrip/components/logintextfield.dart';
import 'package:maxtrip/components/pesan_error.dart';
import 'package:maxtrip/halaman/mainpage.dart'; // Import HalHome widget

class HalLogin extends StatelessWidget {
  HalLogin({Key? key}) : super(key: key); // Fix constructor syntax

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      // Show success message dialog
      _showSuccessDialog(context);
      // Navigate to the next page after a delay
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      });
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
      String errorMessage = _getErrorMessage(e.code);
      // Show error dialog with message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Data Pengguna Salah'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30),
              Image.asset('lib/images/error.png', width: 60),
              SizedBox(height: 30),
              Text(errorMessage),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Sukses'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 30),
            Image.asset('lib/images/checklist.png', width: 60),
            SizedBox(height: 30),
            Text(ErrorMessages.loginSuccess),
          ],
        ),
      ),
    );
  }

  String _getErrorMessage(String code) {
    switch (code) {
      case 'invalid-email':
        return ErrorMessages.invalidEmail;
      case 'user-not-found':
        return ErrorMessages.userNotFound;
      case 'wrong-password':
        return ErrorMessages.wrongPassword;
      default:
        return 'An error occurred.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Card(
              color: Colors.grey.shade200,
              elevation: 20.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      'Selamat Datang!',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                        height: 120,
                        child: Image.asset('lib/images/maxtripsloganblack.png'),
                      ),
                    ),
                    SizedBox(height: 50),
                    MyTextField(
                      controller: emailController,
                      petunjukunama: 'Email',
                      sensorpass: false,
                    ),
                    SizedBox(height: 20),
                    MyTextField(
                      controller: passwordController,
                      petunjukunama: 'Password',
                      sensorpass: true,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Implement Forgot Password functionality
                          },
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 11,
                            ),
                          ),
                        ),
                      ],
                    ),
                    MyButton(
                      onTap: () =>
                          loginUser(context), // Call loginUser with context
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Atau login dengan',
                      style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'lib/images/google.png',
                          width: 50,
                          height: 50,
                        ),
                        Image.asset(
                          'lib/images/facebook.png',
                          width: 50,
                          height: 50,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
