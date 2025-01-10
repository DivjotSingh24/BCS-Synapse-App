import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:bcs/screens/splash_screen.dart'; // Update with your actual import

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        
      ),
      home: const SplashScreen(),
    );
  }
}
