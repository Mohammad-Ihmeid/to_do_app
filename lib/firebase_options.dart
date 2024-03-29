// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyBShksZhVMt159BkhO2078wOoUpYZdCvBc',
    appId: '1:1046924702446:web:82737ac25cc6b3196af9ff',
    messagingSenderId: '1046924702446',
    projectId: 'to-do-app-ff990',
    authDomain: 'to-do-app-ff990.firebaseapp.com',
    storageBucket: 'to-do-app-ff990.appspot.com',
    measurementId: 'G-4Q3PXM4YYY',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAQJ3l_SUfVbnAODFGBhksjCVTVXAyCTFE',
    appId: '1:1046924702446:android:5394c447784cd1c26af9ff',
    messagingSenderId: '1046924702446',
    projectId: 'to-do-app-ff990',
    storageBucket: 'to-do-app-ff990.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDMGZfjtlcxq_TzpJ0yiwBq1wrf4Ssixag',
    appId: '1:1046924702446:ios:4024e2af5351a2c56af9ff',
    messagingSenderId: '1046924702446',
    projectId: 'to-do-app-ff990',
    storageBucket: 'to-do-app-ff990.appspot.com',
    iosBundleId: 'com.example.toDoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDMGZfjtlcxq_TzpJ0yiwBq1wrf4Ssixag',
    appId: '1:1046924702446:ios:ab49151a2e4c36976af9ff',
    messagingSenderId: '1046924702446',
    projectId: 'to-do-app-ff990',
    storageBucket: 'to-do-app-ff990.appspot.com',
    iosBundleId: 'com.example.toDoApp.RunnerTests',
  );
}
