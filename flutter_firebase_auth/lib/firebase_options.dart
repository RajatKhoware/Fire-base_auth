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
    apiKey: 'AIzaSyAXu1yMFRWXkUjHW75nb0do5p26f7RRJjg',
    appId: '1:899204205575:web:10dc8abe232575186ceea2',
    messagingSenderId: '899204205575',
    projectId: 'flutter-firebase-auth-8e6e9',
    authDomain: 'flutter-firebase-auth-8e6e9.firebaseapp.com',
    storageBucket: 'flutter-firebase-auth-8e6e9.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCf6MKd83VmEssLVRfCMcL_CR1Bs73nxkM',
    appId: '1:899204205575:android:fec4283eafe700aa6ceea2',
    messagingSenderId: '899204205575',
    projectId: 'flutter-firebase-auth-8e6e9',
    storageBucket: 'flutter-firebase-auth-8e6e9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBsJdGRckzxEUikSKGwaddJyDQduPlmOdo',
    appId: '1:899204205575:ios:51d394f7f0cfc7036ceea2',
    messagingSenderId: '899204205575',
    projectId: 'flutter-firebase-auth-8e6e9',
    storageBucket: 'flutter-firebase-auth-8e6e9.appspot.com',
    iosClientId: '899204205575-pi1kgu9gd8ji63hkf7hpcln2nf47fnmj.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebaseAuth',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBsJdGRckzxEUikSKGwaddJyDQduPlmOdo',
    appId: '1:899204205575:ios:51d394f7f0cfc7036ceea2',
    messagingSenderId: '899204205575',
    projectId: 'flutter-firebase-auth-8e6e9',
    storageBucket: 'flutter-firebase-auth-8e6e9.appspot.com',
    iosClientId: '899204205575-pi1kgu9gd8ji63hkf7hpcln2nf47fnmj.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterFirebaseAuth',
  );
}
