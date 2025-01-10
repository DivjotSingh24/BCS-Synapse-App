import 'package:bcs/screens/home_screen.dart';
import 'package:bcs/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to the appropriate screen after a 2-second delay
    Future.delayed(const Duration(seconds: 3), () {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) {
        _navigateToLogin();
      } else {
        _navigateToHomescreen();
      }
    });
  }

  void _navigateToLogin() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ));
  }

  void _navigateToHomescreen() {
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) => const HomeScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset('assets/images/old_standee[1].png'),
        ),
      ),
    );
  }
}
