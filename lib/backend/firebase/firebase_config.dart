import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDcNlGJB3ljZxXqW1gA6yI2blUb324I_q0",
            authDomain: "semicolon-a0f08.firebaseapp.com",
            projectId: "semicolon-a0f08",
            storageBucket: "semicolon-a0f08.appspot.com",
            messagingSenderId: "488032157491",
            appId: "1:488032157491:web:a5e0fa2ee11b464cbec846"));
  } else {
    await Firebase.initializeApp();
  }
}
