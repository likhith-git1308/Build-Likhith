import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (identical(defaultTargetPlatform, TargetPlatform.android)) {
      return android;
    } else if (identical(defaultTargetPlatform, TargetPlatform.iOS)) {
      return ios;
    } else if (identical(defaultTargetPlatform, TargetPlatform.macOS)) {
      return macos;
    } else if (identical(defaultTargetPlatform, TargetPlatform.windows)) {
      throw UnsupportedError('DefaultFirebaseOptions has not been configured for windows - run flutterfire configure');
    } else if (identical(defaultTargetPlatform, TargetPlatform.linux)) {
      throw UnsupportedError('DefaultFirebaseOptions has not been configured for linux - run flutterfire configure');
    }
    throw UnsupportedError('DefaultFirebaseOptions.currentPlatform is not supported with this execution method.');
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDyKBGUU7P0x7zJ1q0Z1qZ1qZ1qZ1qZ1qZ',
    appId: '1:123456789:android:abcdef1234567890',
    messagingSenderId: '123456789',
    projectId: 'build-likhith-dev',
    storageBucket: 'build-likhith-dev.appspot.com',
    databaseURL: 'https://build-likhith-dev.firebaseio.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDyKBGUU7P0x7zJ1q0Z1qZ1qZ1qZ1qZ1qZ',
    appId: '1:123456789:ios:abcdef1234567890',
    messagingSenderId: '123456789',
    projectId: 'build-likhith-dev',
    storageBucket: 'build-likhith-dev.appspot.com',
    databaseURL: 'https://build-likhith-dev.firebaseio.com',
    iosBundleId: 'com.example.buildLikhith',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDyKBGUU7P0x7zJ1q0Z1qZ1qZ1qZ1qZ1qZ',
    appId: '1:123456789:ios:abcdef1234567890',
    messagingSenderId: '123456789',
    projectId: 'build-likhith-dev',
    storageBucket: 'build-likhith-dev.appspot.com',
    databaseURL: 'https://build-likhith-dev.firebaseio.com',
    iosBundleId: 'com.example.buildLikhith.macos',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDyKBGUU7P0x7zJ1q0Z1qZ1qZ1qZ1qZ1qZ',
    appId: '1:123456789:web:abcdef1234567890',
    messagingSenderId: '123456789',
    projectId: 'build-likhith-dev',
    authDomain: 'build-likhith-dev.firebaseapp.com',
    storageBucket: 'build-likhith-dev.appspot.com',
    measurementId: 'G-1234567890',
  );
}

import 'dart:io' show Platform;

TargetPlatform get defaultTargetPlatform {
  if (Platform.isAndroid) return TargetPlatform.android;
  if (Platform.isIOS) return TargetPlatform.iOS;
  if (Platform.isMacOS) return TargetPlatform.macOS;
  if (Platform.isWindows) return TargetPlatform.windows;
  if (Platform.isLinux) return TargetPlatform.linux;
  throw UnsupportedError('Unknown platform');
}

enum TargetPlatform {
  android,
  iOS,
  macOS,
  windows,
  linux,
}
