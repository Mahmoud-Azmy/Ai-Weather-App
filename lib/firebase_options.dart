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
    apiKey: 'AIzaSyBlkJ3fciDPl__sn8c_hf5ypXquYEHYaF4',
    appId: '1:336764804951:web:6c7de32b82caae44016812',
    messagingSenderId: '336764804951',
    projectId: 'ai-weather-app-ba636',
    authDomain: 'ai-weather-app-ba636.firebaseapp.com',
    storageBucket: 'ai-weather-app-ba636.firebasestorage.app',
    measurementId: 'G-27WXVG39WN',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_aUsDAharJ_9CWxAm6ZF8jwK0z52NG5M',
    appId: '1:336764804951:android:962f2a4e25e1612d016812',
    messagingSenderId: '336764804951',
    projectId: 'ai-weather-app-ba636',
    storageBucket: 'ai-weather-app-ba636.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhCtwYiYIIrkWq8ln0u3xNlxS5fDOoLLM',
    appId: '1:336764804951:ios:cce7a07c315c11ac016812',
    messagingSenderId: '336764804951',
    projectId: 'ai-weather-app-ba636',
    storageBucket: 'ai-weather-app-ba636.firebasestorage.app',
    iosBundleId: 'com.example.aiWeatherApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhCtwYiYIIrkWq8ln0u3xNlxS5fDOoLLM',
    appId: '1:336764804951:ios:cce7a07c315c11ac016812',
    messagingSenderId: '336764804951',
    projectId: 'ai-weather-app-ba636',
    storageBucket: 'ai-weather-app-ba636.firebasestorage.app',
    iosBundleId: 'com.example.aiWeatherApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBlkJ3fciDPl__sn8c_hf5ypXquYEHYaF4',
    appId: '1:336764804951:web:b746a9f222f8330d016812',
    messagingSenderId: '336764804951',
    projectId: 'ai-weather-app-ba636',
    authDomain: 'ai-weather-app-ba636.firebaseapp.com',
    storageBucket: 'ai-weather-app-ba636.firebasestorage.app',
    measurementId: 'G-002F95PKCV',
  );
}
