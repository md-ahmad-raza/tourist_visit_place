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
    apiKey: 'AIzaSyBSbo6BX7H8Qxa8Fabgi57XMjp9xSqVkyk',
    appId: '1:94325738726:web:6730f723ee4b4397043f27',
    messagingSenderId: '94325738726',
    projectId: 'travel-2a023',
    authDomain: 'travel-2a023.firebaseapp.com',
    storageBucket: 'travel-2a023.firebasestorage.app',
    measurementId: 'G-BXQ8W24GRH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBeNsxSiLAiEMWXFtwc-HSD-CaUwufVLZA',
    appId: '1:94325738726:android:91ba0f6b23392e2c043f27',
    messagingSenderId: '94325738726',
    projectId: 'travel-2a023',
    storageBucket: 'travel-2a023.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA1nfVYXO0d0UE1mQxbT5ZreZYAwqFjmus',
    appId: '1:94325738726:ios:0128544e936c468a043f27',
    messagingSenderId: '94325738726',
    projectId: 'travel-2a023',
    storageBucket: 'travel-2a023.firebasestorage.app',
    iosBundleId: 'com.example.touristVisitPlace',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA1nfVYXO0d0UE1mQxbT5ZreZYAwqFjmus',
    appId: '1:94325738726:ios:0128544e936c468a043f27',
    messagingSenderId: '94325738726',
    projectId: 'travel-2a023',
    storageBucket: 'travel-2a023.firebasestorage.app',
    iosBundleId: 'com.example.touristVisitPlace',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBSbo6BX7H8Qxa8Fabgi57XMjp9xSqVkyk',
    appId: '1:94325738726:web:30c17d11868ec942043f27',
    messagingSenderId: '94325738726',
    projectId: 'travel-2a023',
    authDomain: 'travel-2a023.firebaseapp.com',
    storageBucket: 'travel-2a023.firebasestorage.app',
    measurementId: 'G-500JBHMQFP',
  );
}
