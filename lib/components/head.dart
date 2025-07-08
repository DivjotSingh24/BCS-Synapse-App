
import 'package:flutter/material.dart';
import 'package:bcs/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Head extends StatelessWidget {
  const Head({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(
          top: size.height * 0.05,
          right: size.height * 0.01,
          left: size.height * 0.01),
      padding: EdgeInsets.only(right: size.width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            'assets/images/bcslogo.png',
            width: size.width * 0.13,
          ),
          Image.asset(
            'assets/images/headertext.png',
            width: size.width * 0.38,
          ),
          PopupMenuButton<String>(
            icon:
                Icon(Icons.menu, size: size.width * 0.08, color: Colors.white),
            offset: Offset(0, size.height * 0.063),
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  height: size.height * 0.03,
                  child: InkWell(
                    onTap: () => _logout(context),
                    child: Row(
                      children: [
                        Icon(Icons.logout,
                            color: const Color.fromARGB(255, 249, 36, 36)),
                        SizedBox(width: size.width * 0.018),
                        Text(
                          'Logout',
                          style: TextStyle(fontSize: size.height * 0.022),
                        ),
                      ],
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
    );
  }

  void _logout(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logout failed: ${e.toString()}')),
      );
    }
  }
}
