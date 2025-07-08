
import 'package:bcs/screens/navbar.dart';
import 'package:flutter/material.dart';
import 'package:bcs/components/aboutEvent.dart';
import 'package:bcs/components/eventList.dart';
import 'package:bcs/components/head.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bcs/components/trailerHeading.dart';
import 'package:bcs/components/eventHeading.dart';
import 'package:bcs/functions/timer.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<String> userRoleFuture;
  VideoPlayerController? _videoController;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    userRoleFuture = getUserRole();
    _initializeVideo();
  }

  Future<String> getUserRole() async {
    try {
      final currentUser = FirebaseAuth.instance.currentUser;
      if (currentUser == null) return 'user';

      final userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser.uid)
          .get();

      return userDoc.exists ? (userDoc.data()?['Role'] ?? 'user') : 'user';
    } catch (e) {
      print("Error fetching user role: $e");
      return 'user';
    }
  }

  void _initializeVideo() async {
    try {
      _videoController = VideoPlayerController.networkUrl(
        Uri.parse("https://res.cloudinary.com/dbfyyjgmk/video/upload/v1738849547/trailer_liegsa.mp4"),
      )..initialize().then((_) {
          setState(() {}); // Ensure UI updates after initialization
          _videoController!.setLooping(true);
          _videoController!.play();
        }).catchError((error) {
          print("Error initializing video: $error");
        });
    } catch (error) {
      print("Error initializing video: $error");
    }
  }

  void _togglePlayPause() {
    if (_videoController != null && _videoController!.value.isInitialized) {
      setState(() {
        if (_videoController!.value.isPlaying) {
          _videoController!.pause();
        } else {
          _videoController!.play();
        }
        _isPlaying = _videoController!.value.isPlaying;
      });
    }
  }

  @override
  void dispose() {
    _videoController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: FutureBuilder<String>(
        future: userRoleFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return Container(
            color: Colors.black,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Head(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.035,
                        horizontal: size.height * 0.015),
                    child: Container(
                      height: size.height * 0.22,
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/back.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          CountdownTimerCard(
                            size: size,
                            startTime: DateTime(2025, 2, 7, 0, 0, 0),
                            endTime: DateTime(2025, 2, 10, 0, 0, 0),
                          ),
                        ],
                      ),
                    ),
                  ),
                  EventHeading(),
                  EventList(),
                  TrailerHeading(),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: size.width * 0.01,
                        horizontal: size.width * 0.045),
                    child: Container(
                      height: size.height * 0.25, // Ensure enough height for visibility
                      width: double.infinity,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.black, // Background for contrast
                      ),
                      child: _videoController != null &&
                              _videoController!.value.isInitialized
                          ? Stack(
                              alignment: Alignment.center,
                              children: [
                                AspectRatio(
                                  aspectRatio:
                                      _videoController!.value.aspectRatio,
                                  child: VideoPlayer(_videoController!),
                                ),
                                Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          _isPlaying
                                              ? Icons.pause
                                              : Icons.play_arrow,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        onPressed: _togglePlayPause,
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.replay_10,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          _videoController!.seekTo(
                                            _videoController!.value.position -
                                                const Duration(seconds: 10),
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: const Icon(
                                          Icons.forward_10,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        onPressed: () {
                                          _videoController!.seekTo(
                                            _videoController!.value.position +
                                                const Duration(seconds: 10),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ),
                  AboutEvent(),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedIndex: 0),
    );
  }
}
