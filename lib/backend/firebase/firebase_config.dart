import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBrTfMaZoaRo6kAquqFmP9Hixccu_jBrV0",
            authDomain: "progem-eb73e.firebaseapp.com",
            projectId: "progem-eb73e",
            storageBucket: "progem-eb73e.appspot.com",
            messagingSenderId: "367356848086",
            appId: "1:367356848086:web:92584ce1affd4a5cbda677",
            measurementId: "G-DHG3V5YWY2"));
  } else {
    await Firebase.initializeApp();
  }
}
