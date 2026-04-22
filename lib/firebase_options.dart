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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZIY25nRocY9MtL4dDdq20I0hDNMUhdKo',
    appId: '1:452855681673:android:4f24aac78e464563de6c58',
    messagingSenderId: '452855681673',
    projectId: 'inventaryapp-aa62c',
    storageBucket: 'inventaryapp-aa62c.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkX90xtznUXP5hYUyQ9rA96GBPnu3Dn3A',
    appId: '1:452855681673:ios:e162c0a6234cbfd8de6c58',
    messagingSenderId: '452855681673',
    projectId: 'inventaryapp-aa62c',
    storageBucket: 'inventaryapp-aa62c.firebasestorage.app',
    iosBundleId: 'com.example.inventoryApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDGx8B8TlmpAmJF2x_pzBmkHNzD6SfRngw',
    appId: '1:452855681673:web:57e3cdf1b8493f2ede6c58',
    messagingSenderId: '452855681673',
    projectId: 'inventaryapp-aa62c',
    authDomain: 'inventaryapp-aa62c.firebaseapp.com',
    storageBucket: 'inventaryapp-aa62c.firebasestorage.app',
    measurementId: 'G-KQZSQ1HETE',
  );
}
