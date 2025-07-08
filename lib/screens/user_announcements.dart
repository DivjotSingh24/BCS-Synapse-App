
import 'dart:ui';
import 'package:bcs/screens/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UserAnnouncementsScreen extends StatelessWidget {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image - Stretched to fill the entire screen
          Positioned.fill(
            child: Image.asset(
              'assets/images/abg.jpg', // Background image
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),

          // Foreground content with transparency
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: size.height * 0.045),
                      Image.asset(
                        'assets/images/headertext.png', // Title image
                        width: size.width * 0.4, // Adjust width as needed
                      ),
                      SizedBox(height: size.height * 0.016), // Spacing

                      Padding(
                        padding: EdgeInsets.all(size.height * 0.023),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(20), // Rounded edges
                          child: Image.asset(
                            "assets/images/umsg.png",
                            width: double.infinity, // Full width
                            height:
                                size.height * 0.20, // Adjust height dynamically
                            fit: BoxFit.cover, // Ensure it fills properly
                          ),
                        ),
                      ),

                      StreamBuilder(
                        stream: db
                            .collection("announcements")
                            .orderBy("timestamp", descending: true)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            print(
                                "Firestore Error: ${snapshot.error}"); // Print exact error in console
                            return Center(
                              child: Text(
                                "Error loading announcements: ${snapshot.error}",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }

                          if (!snapshot.hasData ||
                              snapshot.data!.docs.isEmpty) {
                            return Center(
                              child: Text(
                                "No announcements available",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            );
                          }

                          var announcements = snapshot.data!.docs;

                          return Column(
                            children: announcements.map((announcement) {
                              return Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: 8, horizontal: 16),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 10, sigmaY: 10),
                                    child: Card(
                                      color: Colors.black.withOpacity(
                                          0.5), // Semi-transparent background
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ListTile(
                                        title: Text(
                                          announcement["sender_name"] ??
                                              "Admin",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: size.width * 0.05),
                                        ),
                                        subtitle: Text(
                                          announcement["text"] ?? "",
                                          style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.9),
                                              fontSize: size.width * 0.04),
                                        ),
                                        trailing: Text(
                                          _formatTimestamp(
                                              announcement["timestamp"]),
                                          style: TextStyle(
                                              fontSize: size.width * 0.04,
                                              color: Colors.white70),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 1),
    );
  }

  String _formatTimestamp(dynamic timestamp) {
    if (timestamp is Timestamp) {
      DateTime dateTime = timestamp.toDate();
      return "${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute}";
    }
    return "Unknown time";
  }
}
