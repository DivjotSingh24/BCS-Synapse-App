
import 'package:bcs/screens/splash_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginControllers {
  static Future<void> login(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      print("Account created successfully");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return SplashScreen();
      }), (route) {
        return false;
      });
    } catch (e) {
      SnackBar errorsnackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(errorsnackbar);
    }
  }
}
