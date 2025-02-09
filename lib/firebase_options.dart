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
    apiKey: 'AIzaSyD9c6Z9uLkmFY-15xeAJyZ4Ds-lEJLrH4U',
    appId: '1:152875122202:web:18aaa5d0f7eafb8c4fdba3',
    messagingSenderId: '152875122202',
    projectId: 'chating-a9e39',
    authDomain: 'chating-a9e39.firebaseapp.com',
    storageBucket: 'chating-a9e39.appspot.com',
    measurementId: 'G-JQ1VCQ2GQV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDl31IDO_MpO-fvgYqNHqolWvtEEnlDFKs',
    appId: '1:152875122202:android:7c31c95f16afad994fdba3',
    messagingSenderId: '152875122202',
    projectId: 'chating-a9e39',
    storageBucket: 'chating-a9e39.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBP8KVXv4gm6D7-iPC2IGkCD7DrGIXSvXs',
    appId: '1:152875122202:ios:c2274be3773b04cc4fdba3',
    messagingSenderId: '152875122202',
    projectId: 'chating-a9e39',
    storageBucket: 'chating-a9e39.appspot.com',
    iosBundleId: 'com.example.wafed',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBP8KVXv4gm6D7-iPC2IGkCD7DrGIXSvXs',
    appId: '1:152875122202:ios:e97f45bb52d26e434fdba3',
    messagingSenderId: '152875122202',
    projectId: 'chating-a9e39',
    storageBucket: 'chating-a9e39.appspot.com',
    iosBundleId: 'com.example.wafed.RunnerTests',
  );
}
