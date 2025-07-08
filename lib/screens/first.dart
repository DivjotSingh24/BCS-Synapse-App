import 'package:bcs/functions/buildDetailRow copy.dart';
import 'package:flutter/material.dart';

class First extends StatelessWidget {
  final String title;
  final String day;
  // final String time;
  final String place;
  final String image;
  final String about;
  final List<String> rulebook;

  const First(
      {super.key,
      required this.title,
      required this.day,
      // required this.time,
      required this.place,
      required this.image,
      required this.about,
      required this.rulebook});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image.asset(
                image,
                height: size.height * 0.4,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 10,
                child: Padding(
                    padding: EdgeInsets.all(size.height * 0.02),
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: size.height * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 225, 222, 222),
                        shadows: [
                          Shadow(
                            offset: Offset(2, 2),
                            blurRadius: 10.0,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                    )),
              ),
              Positioned(
                bottom: 2,
                left: 0,
                right: 0,
                child: Container(
                  height: size.height * 0.007,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(26),
                        topRight: Radius.circular(26)),
                    // color: const Color.fromARGB(255, 175, 230, 36),
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 14, 4, 4).withOpacity(0.99),
                        blurRadius: 30,
                        spreadRadius: 18,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                clipBehavior: Clip.antiAlias,
                padding: EdgeInsets.all(size.height * 0.02),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 231, 225, 225),
                      blurRadius: 14,
                      spreadRadius: 3.5,
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black,
                      // Color(0xFF1f1c18),
                      Color(0xFF1f1c18).withOpacity(0.84),
                      Color(0xFF8e0e00),
                      const Color.fromARGB(220, 48, 46, 46),

                      Color(0xFF8e0e00),
                      Color(0xFF1f1c18),
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: size.height * 0.013),
                      child: Container(
                        padding: EdgeInsets.all(size.height * 0.02),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.25),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            DetailRow(
                              icon: Icons.access_time_filled,
                              text: day,
                            ),
                            SizedBox(height: size.height * 0.01),
                            // DetailRow(
                            //   icon: Icons.calendar_month,
                            //   text: time,
                            // ),
                            // SizedBox(height: size.height * 0.01),
                            DetailRow(
                              icon: Icons.location_on,
                              text: place,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      width: size.width * 0.9,
                      height: size.height * 0.003,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 9, 9, 9),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      about,
                      style: TextStyle(
                        fontSize: size.height * 0.0216,
                        color: const Color.fromARGB(255, 246, 244, 244),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Container(
                      width: size.width * 0.9,
                      height: size.height * 0.003,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 9, 9, 9),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        children: rulebook
                            .map(
                              (rule) => Padding(
                                padding:
                                    EdgeInsets.only(bottom: size.height * 0.01),
                                child: Text(
                                  rule,
                                  style: TextStyle(
                                    color: const Color.fromARGB(
                                        255, 241, 240, 240),
                                    fontSize: size.height * 0.021,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
