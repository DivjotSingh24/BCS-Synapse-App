import 'package:bcs/screens/admin_announcements.dart';
import 'package:bcs/screens/calendar.dart';
import 'package:bcs/screens/user_announcements.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'home_screen.dart';

class CustomBottomNavBar extends StatefulWidget {
  final int selectedIndex;

  const CustomBottomNavBar({Key? key, required this.selectedIndex})
      : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.selectedIndex;
  }

  Future<String> getUserRole() async {
    try {
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(currentUser.uid)
            .get();

        // Extract and return the role
        return userDoc['Role'] ?? 'user'; // Default to 'user' if role is null
      } else {
        // Handle case where no user is signed in
        return 'user'; // Default to 'user'
      }
    } catch (e) {
      // Handle any errors (e.g., Firestore access issues)
      print('Error fetching user role: $e');
      return 'user'; // Default to 'user' on error
    }
  }

  Future<bool> _onWillPop() async {
    if (_currentIndex != 0) {
      // If not on HomeScreen, go to HomeScreen
      setState(() {
        _currentIndex = 0;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
      );
      return false; // Prevent default back behavior
    } else {
      return true; // Exit app if already on HomeScreen
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
            backgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey.shade800,
            gap: 8,
            padding: const EdgeInsets.all(16),
            selectedIndex: widget.selectedIndex,
            onTabChange: (index) async {
              if (index == 0) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomeScreen()),
                );
              } else if (index == 1) {
                String role = await getUserRole();
                if (role == "admin") {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => AdminAnnouncementsScreen()),
                  );
                } else {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (_) => UserAnnouncementsScreen()),
                  );
                }
              } else if (index == 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => Calendarscreen()),
                );
              }
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.announcement,
                text: 'Announcements',
              ),
              GButton(
                icon: Icons.calendar_month,
                text: 'Calendar',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
