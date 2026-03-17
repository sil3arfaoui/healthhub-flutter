import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAviqGlOURt45apUswVV4roZ4Hnk99LSR4",
            authDomain: "test-h9j5t6.firebaseapp.com",
            projectId: "test-h9j5t6",
            storageBucket: "test-h9j5t6.firebasestorage.app",
            messagingSenderId: "403949433543",
            appId: "1:403949433543:web:864717a411a39c575d84e2"));
  } else {
    await Firebase.initializeApp();
  }
}
