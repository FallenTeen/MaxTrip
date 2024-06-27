import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:maxtrip/components/loginbutton.dart';
import 'package:maxtrip/components/logintextfield.dart';
import 'package:maxtrip/components/pesan_error.dart';
import 'package:maxtrip/halaman/mainpage.dart';

class HalLogin extends StatelessWidget {
  HalLogin({Key? key}) : super(key: key);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void loginUser(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      _showSuccessDialog(context);
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      });
    } on FirebaseAuthException catch (e) {
      print('Error: ${e.message}');
      String errorMessage = _getErrorMessage(e.code);
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

    Future.delayed(Duration(seconds: 1), () {
      Navigator.of(context).pop();
    });
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

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return; // The user canceled the sign-in
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
      _showSuccessDialog(context);
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      });
    } catch (e) {
      print('Error: $e');
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Failed to sign in with Google: $e'),
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

  // Future<void> signInWithFacebook(BuildContext context) async {
  //   try {
  //     final LoginResult result = await FacebookAuth.instance.login();
  //     if (result.status == LoginStatus.success) {
  //       final AccessToken accessToken = result.accessToken!;
  //       final AuthCredential credential =
  //           FacebookAuthProvider.credential(accessToken.token);
  //       await FirebaseAuth.instance.signInWithCredential(credential);
  //       _showSuccessDialog(context);
  //       Future.delayed(Duration(seconds: 2), () {
  //         Navigator.pushReplacement(
  //           context,
  //           MaterialPageRoute(builder: (context) => MainPage()),
  //         );
  //       });
  //     } else {
  //       print('Error: ${result.message}');
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: Text('Login Failed'),
  //           content: Text('Failed to sign in with Facebook: ${result.message}'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //               child: Text('OK'),
  //             ),
  //           ],
  //         ),
  //       );
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //         title: Text('Login Failed'),
  //         content: Text('Failed to sign in with Facebook: $e'),
  //         actions: [
  //           TextButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('OK'),
  //           ),
  //         ],
  //       ),
  //     );
  //   }
  // }

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
                      onTap: () => loginUser(context),
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
                        GestureDetector(
                          onTap: () => signInWithGoogle(context),
                          child: Image.asset(
                            'lib/images/google.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
                        GestureDetector(
                          //   onTap: () => signInWithFacebook(context),
                          child: Image.asset(
                            'lib/images/facebook.png',
                            width: 50,
                            height: 50,
                          ),
                        ),
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
