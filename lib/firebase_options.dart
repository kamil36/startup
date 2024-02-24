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
    apiKey: 'AIzaSyAnT5yRza8Lsw9l4k6q_lwv-Ii_IvUlfNg',
    appId: '1:182753857440:web:59fe4933fd9c5269c1dec5',
    messagingSenderId: '182753857440',
    projectId: 'startup-89ee4',
    authDomain: 'startup-89ee4.firebaseapp.com',
    storageBucket: 'startup-89ee4.appspot.com',
    measurementId: 'G-2N4TCMLX0E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDRaw-v3VMj_9lFcURNbkjvVX07tn1gw2Q',
    appId: '1:182753857440:android:e3161a495c2ee292c1dec5',
    messagingSenderId: '182753857440',
    projectId: 'startup-89ee4',
    storageBucket: 'startup-89ee4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyClDyHgAQ85ID-aNhkvF3FZ-AiTU0NM_8w',
    appId: '1:182753857440:ios:60eadecf292b46b5c1dec5',
    messagingSenderId: '182753857440',
    projectId: 'startup-89ee4',
    storageBucket: 'startup-89ee4.appspot.com',
    iosBundleId: 'com.example.startUp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyClDyHgAQ85ID-aNhkvF3FZ-AiTU0NM_8w',
    appId: '1:182753857440:ios:af405b59bbbcc5d4c1dec5',
    messagingSenderId: '182753857440',
    projectId: 'startup-89ee4',
    storageBucket: 'startup-89ee4.appspot.com',
    iosBundleId: 'com.example.startUp.RunnerTests',
  );
}
