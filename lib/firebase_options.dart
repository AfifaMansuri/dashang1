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
    apiKey: 'AIzaSyANx-Li4Y967l5_wEXpDqNpOmZuh0t5N74',
    appId: '1:411098121380:web:922b3e6a13674347c15231',
    messagingSenderId: '411098121380',
    projectId: 'das1-f164d',
    authDomain: 'das1-f164d.firebaseapp.com',
    storageBucket: 'das1-f164d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB918gXkOXVpfJBKHxoi9qO0e7geqSwdKs',
    appId: '1:411098121380:android:7568d23891e84519c15231',
    messagingSenderId: '411098121380',
    projectId: 'das1-f164d',
    storageBucket: 'das1-f164d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC_GUnlSb8XFRDrChduT4lr-nncgkERHZc',
    appId: '1:411098121380:ios:7468879437916393c15231',
    messagingSenderId: '411098121380',
    projectId: 'das1-f164d',
    storageBucket: 'das1-f164d.appspot.com',
    iosBundleId: 'com.example.dashang1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC_GUnlSb8XFRDrChduT4lr-nncgkERHZc',
    appId: '1:411098121380:ios:d6e692d316f03e1fc15231',
    messagingSenderId: '411098121380',
    projectId: 'das1-f164d',
    storageBucket: 'das1-f164d.appspot.com',
    iosBundleId: 'com.example.dashang1.RunnerTests',
  );
}
