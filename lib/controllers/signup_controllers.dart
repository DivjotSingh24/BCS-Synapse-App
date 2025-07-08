import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:bcs/screens/login_screen.dart';

class SignupControllers {
  static Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        final OAuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final User? user = userCredential.user;

        if (user != null) {
          final String? email = user.email;

          // Check if the email ends with 'be23@thapar.edu' or 'be24@thapar.edu'
          if (email != null &&
              (email.endsWith('be23@thapar.edu') ||
                  email.endsWith('be24@thapar.edu'))) {
            final db = FirebaseFirestore.instance;

            final Map<String, dynamic> data = {
              "email": email,
              "Id": user.uid,
              "Role": 'user',
            };

            await db.collection("users").doc(user.uid).set(data);

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Signed in successfully!')),
            );

            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
              (route) => false,
            );
          } else {
            // Sign out the user if their email does not match the allowed domains
            await FirebaseAuth.instance.signOut();
            await googleSignIn.signOut();

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Only Thapar.edu emails are allowed.'),
              ),
            );
          }
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }
}
