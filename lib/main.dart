import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:maxtrip/firebase_options.dart';
import 'package:maxtrip/halaman/authpage.dart';
import 'package:maxtrip/halaman/hal_utama.dart';
import 'package:maxtrip/screens/mainpage.dart';
import 'halaman/hal_login.dart';
import 'screens/hotels_screen.dart';
import 'screens/activities_screen.dart';
import 'widgets/side_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
