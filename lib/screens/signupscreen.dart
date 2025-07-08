

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:bcs/controllers/signup_controllers.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    // Initialize the video controller with sound muted
    _videoController =
        VideoPlayerController.asset('assets/videos/2signupvid.mp4')
          ..initialize().then((_) {
            _videoController.setLooping(true);
            _videoController.setVolume(0.0); // Mute the video
            _videoController.play();
            setState(() {});
          }).catchError((error) {
            debugPrint('Error initializing video: $error');
          });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Video background with loading check
          if (_videoController.value.isInitialized)
            SizedBox.expand(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width: _videoController.value.size.width,
                  height: _videoController.value.size.height,
                  child: VideoPlayer(_videoController),
                ),
              ),
            )
          else
            const Center(child: CircularProgressIndicator()),

          // Glassmorphic container at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Group 5 Image (Background for the logo and button)
                      Image.asset(
                        'assets/images/c.png', // Path to Group 5 image
                        height: size.height * 0.9,
                        fit: BoxFit.contain,
                      ),

                      // Sign-up button
                      Positioned(
                        bottom:
                            size.height * 0.08, // Adjust to position the button
                        child: OutlinedButton.icon(
                          onPressed: () async {
                            await SignupControllers.signInWithGoogle(context);
                          },
                          icon: Image.asset(
                            'assets/images/icons8-google-96.png',
                            height: size.height * 0.027,
                          ),
                          label: Text(
                            "Sign Up with Google",
                            style: TextStyle(fontSize: size.height * 0.02),
                          ),
                          style: OutlinedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 69, 68, 68),
                            foregroundColor:
                                const Color.fromARGB(255, 255, 255, 255),
                            padding: EdgeInsets.symmetric(
                              vertical: size.height * 0.021,
                              horizontal: size.height * 0.021,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
