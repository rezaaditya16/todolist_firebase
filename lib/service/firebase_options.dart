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
    apiKey: 'AIzaSyDtjZ-RV2mpxdo6J9jMPDEnI7KYtKv8xRg',
    appId: '1:644654334065:web:4a0178c99af03f22a29bd0',
    messagingSenderId: '644654334065',
    projectId: 'to-do-list-e9f1c',
    authDomain: 'to-do-list-e9f1c.firebaseapp.com',
    storageBucket: 'to-do-list-e9f1c.firebasestorage.app',
    measurementId: 'G-KXW1VEZX67',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC1mII2Qje8KBoXvQCY15kDY4-36-A2Yuc',
    appId: '1:644654334065:android:703253ee35a10c38a29bd0',
    messagingSenderId: '644654334065',
    projectId: 'to-do-list-e9f1c',
    storageBucket: 'to-do-list-e9f1c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD1qWFJOZmbcHoD_0yCwE65HsCnVkRJnJQ',
    appId: '1:644654334065:ios:ff2d56eb113bb021a29bd0',
    messagingSenderId: '644654334065',
    projectId: 'to-do-list-e9f1c',
    storageBucket: 'to-do-list-e9f1c.firebasestorage.app',
    iosBundleId: 'com.example.todolistFirebase',
  );
}
