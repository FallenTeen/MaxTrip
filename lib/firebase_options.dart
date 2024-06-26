// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCh8T2Ldz1soQ3othN4gTUZQsMVlXeQmyc',
    appId: '1:959050064681:web:160f90b243e06089f24d38',
    messagingSenderId: '959050064681',
    projectId: 'maxtrip-a968f',
    authDomain: 'maxtrip-a968f.firebaseapp.com',
    storageBucket: 'maxtrip-a968f.appspot.com',
    measurementId: 'G-GWW97XCH36',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBbJzU1-sn8AB8VYFxC9GvF4CYdVqnDwrc',
    appId: '1:959050064681:android:5e6ba34a0ed1e1b2f24d38',
    messagingSenderId: '959050064681',
    projectId: 'maxtrip-a968f',
    storageBucket: 'maxtrip-a968f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABG4JlMbKvgfW_U-HFCUsSRTGRgp5Bj78',
    appId: '1:959050064681:ios:5a4bbde1d59e428af24d38',
    messagingSenderId: '959050064681',
    projectId: 'maxtrip-a968f',
    storageBucket: 'maxtrip-a968f.appspot.com',
    iosClientId:
        '959050064681-is4vqjj9803japbm0e87j1ci2sm6krur.apps.googleusercontent.com',
    iosBundleId: 'com.example.maxtrip',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyABG4JlMbKvgfW_U-HFCUsSRTGRgp5Bj78',
    appId: '1:959050064681:ios:5a4bbde1d59e428af24d38',
    messagingSenderId: '959050064681',
    projectId: 'maxtrip-a968f',
    storageBucket: 'maxtrip-a968f.appspot.com',
    iosClientId:
        '959050064681-is4vqjj9803japbm0e87j1ci2sm6krur.apps.googleusercontent.com',
    iosBundleId: 'com.example.maxtrip',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCh8T2Ldz1soQ3othN4gTUZQsMVlXeQmyc',
    appId: '1:959050064681:web:07cb472ea6f659a0f24d38',
    messagingSenderId: '959050064681',
    projectId: 'maxtrip-a968f',
    authDomain: 'maxtrip-a968f.firebaseapp.com',
    storageBucket: 'maxtrip-a968f.appspot.com',
    measurementId: 'G-22YGRXL3DT',
  );
}
