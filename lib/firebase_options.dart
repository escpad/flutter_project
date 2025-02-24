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
    apiKey: 'AIzaSyCEwlnyjzcA6C0ThpNkqgV38AWbriV_fVU',
    appId: '1:470507242169:web:31bf235ede48c289689168',
    messagingSenderId: '470507242169',
    projectId: 'notetakingapp-394c1',
    authDomain: 'notetakingapp-394c1.firebaseapp.com',
    storageBucket: 'notetakingapp-394c1.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAXW5gGfzyYaUKLNHriBtZ86vqK-hum63s',
    appId: '1:470507242169:android:bf838a0cc701ac24689168',
    messagingSenderId: '470507242169',
    projectId: 'notetakingapp-394c1',
    storageBucket: 'notetakingapp-394c1.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCmzyVYkgjcivqM6I_9AbTwOks4oni5ie8',
    appId: '1:470507242169:ios:e78346e8a9a22bb0689168',
    messagingSenderId: '470507242169',
    projectId: 'notetakingapp-394c1',
    storageBucket: 'notetakingapp-394c1.firebasestorage.app',
    iosBundleId: 'com.example.myFirstFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCmzyVYkgjcivqM6I_9AbTwOks4oni5ie8',
    appId: '1:470507242169:ios:e78346e8a9a22bb0689168',
    messagingSenderId: '470507242169',
    projectId: 'notetakingapp-394c1',
    storageBucket: 'notetakingapp-394c1.firebasestorage.app',
    iosBundleId: 'com.example.myFirstFlutter',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCEwlnyjzcA6C0ThpNkqgV38AWbriV_fVU',
    appId: '1:470507242169:web:392dfb6dc2e191fb689168',
    messagingSenderId: '470507242169',
    projectId: 'notetakingapp-394c1',
    authDomain: 'notetakingapp-394c1.firebaseapp.com',
    storageBucket: 'notetakingapp-394c1.firebasestorage.app',
  );
}
