
import 'package:bcs/screens/navbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdminAnnouncementsScreen extends StatefulWidget {
  @override
  _AdminAnnouncementsScreenState createState() =>
      _AdminAnnouncementsScreenState();
}

class _AdminAnnouncementsScreenState extends State<AdminAnnouncementsScreen> {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  final TextEditingController announcementText = TextEditingController();

  String? currentUserEmail;
  int messageCount = 0;
  DateTime? lastAnnouncementTime;

  @override
  void initState() {
    super.initState();
    _fetchCurrentUser();
  }

  Future<void> _fetchCurrentUser() async {
    User? user = auth.currentUser;
    if (user != null) {
      currentUserEmail = user.email;
      print("Current user email: $currentUserEmail");
      await _getAdminStats();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("No user is logged in.")),
      );
    }
  }

  Future<void> _getAdminStats() async {
    if (currentUserEmail == null) return;

    var snapshot = await db
        .collection("announcements")
        .where("sender_email", isEqualTo: currentUserEmail)
        .orderBy("timestamp", descending: true)
        .limit(3)
        .get();

    messageCount = snapshot.docs.length;

    if (messageCount > 0) {
      lastAnnouncementTime =
          (snapshot.docs.first["timestamp"] as Timestamp).toDate();
    }
    setState(() {});
  }

  Future<void> sendAnnouncement() async {
    if (currentUserEmail == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User not authenticated.")),
      );
      return;
    }

    String trimmedText = announcementText.text.trim();
    if (trimmedText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Announcement cannot be empty.")),
      );
      return;
    }

    if (trimmedText.length > 300) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Announcement too long (max 300 characters).")),
      );
      return;
    }

    final currentTime = DateTime.now();

    if (messageCount >= 3) {
      final timeDifference = currentTime.difference(lastAnnouncementTime!);
      if (timeDifference.inMinutes < 10) {
        final remainingTime = 10 - timeDifference.inMinutes;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
                'Wait $remainingTime minute(s) before posting a new announcement.'),
          ),
        );
        return;
      } else {
        messageCount = 0;
      }
    }

    try {
      await db.collection("announcements").add({
        "text": trimmedText,
        "sender_name": "Admin",
        "sender_email": currentUserEmail,
        "timestamp": FieldValue.serverTimestamp(),
      });
      announcementText.clear();
      messageCount++;
      lastAnnouncementTime = currentTime;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Announcement sent successfully!")),
      );
    } catch (e) {
      print("Error sending announcement: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send announcement. Error: $e")),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Admin Announcements")),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: db
                  .collection("announcements")
                  .orderBy("timestamp", descending: true)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("Error loading announcements"));
                }
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                var announcements = snapshot.data!.docs;
                return ListView.builder(
                  itemCount: announcements.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(announcements[index]["sender_name"]),
                      subtitle: Text(announcements[index]["text"]),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: announcementText,
                    maxLength: 300, // Enforces limit on input field
                    decoration: InputDecoration(
                      hintText: "Write announcement here...",
                      border: OutlineInputBorder(),
                      counterText: "", // Hides default counter text
                    ),
                  ),
                ),
                SizedBox(width: 8),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: sendAnnouncement,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 1),
    );
  }
}
