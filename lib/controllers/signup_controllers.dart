import 'package:bcs/screens/login_screen.dart';
import 'package:bcs/screens/splash_screen.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupControllers {
  static Future<void> createAccount(
      {required BuildContext context,
      required String email,
      required String password,
      required String name,
      required String Country}) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      var userid = FirebaseAuth.instance.currentUser!.uid;
      var db = FirebaseFirestore.instance;
      //this instance can be used to give access data in the database
      //users table,every user has their own document and .set will add data to the document
      Map<String, dynamic> data = {
        "name": name,
        "email": email,
        "Country": Country,
        "Id": userid.toString()
      };
      try {
        await db.collection("users").doc(userid.toString()).set(data);
      } catch (e) {
        print(e);
      }

      print("Account created successfully");
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return LoginScreen();
      }), (route) {
        return false;
      });
    } catch (e) {
      SnackBar errorsnackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(errorsnackbar);
    }
  }
}
