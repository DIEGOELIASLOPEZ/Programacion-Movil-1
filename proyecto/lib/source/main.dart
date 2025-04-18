import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Asegúrate de inicializar Firebase
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'YOUR_API_KEY',
      appId: 'YOUR_APP_ID',
      messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
      projectId: 'YOUR_PROJECT_ID',
      authDomain: 'YOUR_AUTH_DOMAIN',
      storageBucket: 'YOUR_STORAGE_BUCKET',
      measurementId: 'YOUR_MEASUREMENT_ID',
    ),
  );

  runApp(MyApp());
}

