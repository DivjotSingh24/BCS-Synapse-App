
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:bcs/controllers/login_controllers.dart';
import 'package:bcs/screens/signupscreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late VideoPlayerController _videoController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    // Initialize the video controller with error handling
    _videoController =
        VideoPlayerController.asset('assets/videos/2signupvid.mp4')
          ..initialize().then((_) {
            _videoController.setLooping(true);
            _videoController.setVolume(0.0);
            _videoController.play();
            setState(() {});
          }).catchError((error) {
            debugPrint('Error initializing video: $error');
          });
  }

  void loginUser() async {
    setState(() {
      isLoading = true; // Show loading indicator
    });

    await LoginControllers.loginWithGoogle(context: context);

    setState(() {
      isLoading = false; // Hide loading indicator after login
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
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  width: double.infinity,
                  height: size.height * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: Center(
                    child: Container(
                      width: size.width * 0.82,
                      padding: EdgeInsets.only(
                          top: size.height * 0.02,
                          bottom: size.height * 0.02,
                          left: size.height * 0.016,
                          right: size.height * 0.016),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(size.width * 0.06),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Login Button
                          OutlinedButton.icon(
                            onPressed: isLoading ? null : loginUser,
                            icon: Image.asset(
                              'assets/images/icons8-google-96.png',
                              height: size.height * 0.04,
                            ),
                            label: isLoading
                                ? CircularProgressIndicator()
                                : Text(
                                    "Log In with Google",
                                    style: TextStyle(
                                      fontSize: size.width * 0.042,
                                    ),
                                  ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 0, 0, 0),
                              foregroundColor:
                                  const Color.fromARGB(255, 165, 161, 161),
                              padding: EdgeInsets.symmetric(
                                vertical: size.height * 0.02,
                                horizontal: size.width * 0.05,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),

                          // Sign-up suggestion
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account? ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: size.height * 0.017,
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignupScreen(),
                                    ),
                                  );
                                },
                                child: Text(
                                  "Click to sign up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: size.height * 0.019,
                                    color: Color.fromARGB(255, 144, 31, 21),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
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
