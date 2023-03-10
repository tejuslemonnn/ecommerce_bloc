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
    apiKey: 'AIzaSyAqVq_yxbJMQW6tjKEgUZGUZP5rahWI0bU',
    appId: '1:95295237576:web:986c7288df5d2445ace4fd',
    messagingSenderId: '95295237576',
    projectId: 'ecommerce-bloc-64a46',
    authDomain: 'ecommerce-bloc-64a46.firebaseapp.com',
    storageBucket: 'ecommerce-bloc-64a46.appspot.com',
    measurementId: 'G-M8K3Q4H0M6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDDt6lqui8-6iTafOB2r6cVnqeQ5smqqsE',
    appId: '1:95295237576:android:7e0393e4f7559381ace4fd',
    messagingSenderId: '95295237576',
    projectId: 'ecommerce-bloc-64a46',
    storageBucket: 'ecommerce-bloc-64a46.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKcWoR6BkDeID-pRWGmwIam3YuNb4JY1Q',
    appId: '1:95295237576:ios:e44c4100ae716f0cace4fd',
    messagingSenderId: '95295237576',
    projectId: 'ecommerce-bloc-64a46',
    storageBucket: 'ecommerce-bloc-64a46.appspot.com',
    iosClientId: '95295237576-eb99u6q733atiuq9m4488sfhidsp037o.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceBloc',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDKcWoR6BkDeID-pRWGmwIam3YuNb4JY1Q',
    appId: '1:95295237576:ios:e44c4100ae716f0cace4fd',
    messagingSenderId: '95295237576',
    projectId: 'ecommerce-bloc-64a46',
    storageBucket: 'ecommerce-bloc-64a46.appspot.com',
    iosClientId: '95295237576-eb99u6q733atiuq9m4488sfhidsp037o.apps.googleusercontent.com',
    iosBundleId: 'com.example.ecommerceBloc',
  );
}
