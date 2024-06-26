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
    apiKey: 'AIzaSyC18ITJIcmxMDNNr3CQifgDxF-P9EG_G-o',
    appId: '1:476998983836:web:08a91b5675b74abfcecd59',
    messagingSenderId: '476998983836',
    projectId: 'kingkane-dhub',
    authDomain: 'kingkane-dhub.firebaseapp.com',
    storageBucket: 'kingkane-dhub.appspot.com',
    measurementId: 'G-CRKPMZ6307',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvdH5fu8_UIXCMCezdDh_JzROyjVG7uM0',
    appId: '1:476998983836:android:6fa0e9acc20ac45ccecd59',
    messagingSenderId: '476998983836',
    projectId: 'kingkane-dhub',
    storageBucket: 'kingkane-dhub.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDr-Vuy36npBpOZkXJVX3CNFhnCUAfxN10',
    appId: '1:476998983836:ios:3a6868482bd7ed26cecd59',
    messagingSenderId: '476998983836',
    projectId: 'kingkane-dhub',
    storageBucket: 'kingkane-dhub.appspot.com',
    iosBundleId: 'com.example.dormList',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDr-Vuy36npBpOZkXJVX3CNFhnCUAfxN10',
    appId: '1:476998983836:ios:3a6868482bd7ed26cecd59',
    messagingSenderId: '476998983836',
    projectId: 'kingkane-dhub',
    storageBucket: 'kingkane-dhub.appspot.com',
    iosBundleId: 'com.example.dormList',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyC18ITJIcmxMDNNr3CQifgDxF-P9EG_G-o',
    appId: '1:476998983836:web:27de6b3795ee120dcecd59',
    messagingSenderId: '476998983836',
    projectId: 'kingkane-dhub',
    authDomain: 'kingkane-dhub.firebaseapp.com',
    storageBucket: 'kingkane-dhub.appspot.com',
    measurementId: 'G-K33BGBJCV8',
  );
}
