import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: EdgeInsets.all(
          size.width * 0.03,
        ),
        child: Column(
          children: [
            buildEventCard(
              context,
              'Evangelion',
              '5:00 PM',
              'Auditorium',
              Colors.blue,
              'Fri',
              '07',
              'Feb',
            ),
            buildEventCard(
              context,
              'Zone Wars',
              '2:00 PM',
              'LMTSM Campus',
              Colors.purple,
              'Sat',
              '08',
              'Feb',
            ),
            buildEventCard(
              context,
              'Search and Destroy',
              '7:00 PM',
              'Academic Building',
              Colors.cyan,
              'Sat',
              '08',
              'Feb',
            ),
            buildEventCard(
              context,
              'Mirage',
              '6:00 PM',
              'Academic Building',
              Colors.yellow,
              'Sun',
              '09',
              'Feb',
            ),
          ],
        ),
      ),
    );
  }

  Widget buildEventCard(
    BuildContext context,
    String title,
    String time,
    String place,
    Color color,
    String day,
    String date,
    String month,
  ) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(
        vertical: size.height * 0.005,
      ),
      padding: EdgeInsets.symmetric(
        vertical: size.height * 0.01,
        horizontal: size.width * 0.03,
      ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.black,
            Colors.black,
            Colors.black,
          ],
        ),
        borderRadius: BorderRadius.circular(
          size.width * 0.03,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.005,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.02,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: size.width * 0.06,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    Lottie.asset(
                      'assets/images/Artboard.json',
                      width: size.width * 0.1,
                      height: size.width * 0.1,
                      fit: BoxFit.fill,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: size.width * 0.025,
                    ),
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.red,
                      size: size.width * 0.045,
                    ),
                    SizedBox(
                      width: size.width * 0.03,
                    ),
                    Text(
                      place,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: size.width * 0.15,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: size.height * 0.01,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    day,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: size.width * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    month,
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
