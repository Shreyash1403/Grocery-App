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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyASDGC8ERaCLhP7rVp-tAjj-hY2UzsYovE',
    appId: '1:570245084438:web:fce391e87fafd492d40c37',
    messagingSenderId: '570245084438',
    projectId: 'grocery-41d6e',
    authDomain: 'grocery-41d6e.firebaseapp.com',
    storageBucket: 'grocery-41d6e.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAwnAVGirIJudPAZTSj3kVh368TFmvVxhM',
    appId: '1:570245084438:android:ee7c471cda581ea3d40c37',
    messagingSenderId: '570245084438',
    projectId: 'grocery-41d6e',
    storageBucket: 'grocery-41d6e.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAzz0PvUq-BHkOmwsU12gZXRUf4BEzB3BI',
    appId: '1:570245084438:ios:a4fa423ef10fe798d40c37',
    messagingSenderId: '570245084438',
    projectId: 'grocery-41d6e',
    storageBucket: 'grocery-41d6e.firebasestorage.app',
    iosBundleId: 'com.example.groceryApp',
  );
}
