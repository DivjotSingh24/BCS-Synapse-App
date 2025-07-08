
import 'package:bcs/components/newCalendar.dart';
import 'package:bcs/screens/calendarView.dart';
import 'package:bcs/screens/navbar.dart';
import 'package:flutter/material.dart';

class Calendarscreen extends StatelessWidget {
  const Calendarscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Background Image - Stretched to fill the entire screen
          Positioned.fill(
            child: Image.asset(
              'assets/images/imgg.jpeg', // Background image
              fit: BoxFit.cover, // Cover the entire screen
            ),
          ),
          Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    // color: const Color.fromARGB(255, 27, 23, 23),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.045),
                        Center(
                          child: Image.asset(
                            'assets/images/headertext.png', // Title image
                            width: size.width * 0.4, // Adjust width as needed
                          ),
                        ),
                        SizedBox(
                            height:
                                size.height * 0.016), // Spacing after header

                        // Event Calendar Title

                        // Calendar Component
                        Calendar(),

                        SizedBox(height: size.height * 0.02),

                        // GIF Image
                        Align(
                          alignment: Alignment.center,
                          child: Image.asset(
                            'assets/videos/Calendervid.gif',
                            width: size.width * 0.9, 
                            height: size.height * 0.3,
                            fit: BoxFit.cover,
                          ),
                        ),

                        SizedBox(height: size.height * 0.02),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.05),
                          child: Text(
                            'Event Calendar',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.height * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),

                        // Calendar View
                        CalendarView(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavBar(selectedIndex: 2),
    );
  }
}
