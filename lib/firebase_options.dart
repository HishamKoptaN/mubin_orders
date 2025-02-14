import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
    apiKey: 'AIzaSyAPv67PyGsQecynSaGX3B46WuZajERQSIY',
    appId: '1:14728606104:web:f71b7f82d4722c7dbc3bed',
    messagingSenderId: '14728606104',
    projectId: 'mubin-c2b92',
    authDomain: 'mubin-c2b92.firebaseapp.com',
    storageBucket: 'mubin-c2b92.firebasestorage.app',
    measurementId: 'G-6NSNDMQZB4',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB6YfewQ8X0wgcICWXedlSVbLrVx0xm8b0',
    appId: '1:14728606104:android:cb64a5ded17c6e45bc3bed',
    messagingSenderId: '14728606104',
    projectId: 'mubin-c2b92',
    storageBucket: 'mubin-c2b92.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBfnmLx6hjXf8Amx3p4iXqDgqM1XAgUB-4',
    appId: '1:14728606104:ios:8fffb306b83484debc3bed',
    messagingSenderId: '14728606104',
    projectId: 'mubin-c2b92',
    storageBucket: 'mubin-c2b92.firebasestorage.app',
    iosBundleId: 'com.example.docsOrders',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBfnmLx6hjXf8Amx3p4iXqDgqM1XAgUB-4',
    appId: '1:14728606104:ios:8fffb306b83484debc3bed',
    messagingSenderId: '14728606104',
    projectId: 'mubin-c2b92',
    storageBucket: 'mubin-c2b92.firebasestorage.app',
    iosBundleId: 'com.example.docsOrders',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAPv67PyGsQecynSaGX3B46WuZajERQSIY',
    appId: '1:14728606104:web:220abfa85b7c6ee8bc3bed',
    messagingSenderId: '14728606104',
    projectId: 'mubin-c2b92',
    authDomain: 'mubin-c2b92.firebaseapp.com',
    storageBucket: 'mubin-c2b92.firebasestorage.app',
    measurementId: 'G-PVBSWY0QHE',
  );
}
