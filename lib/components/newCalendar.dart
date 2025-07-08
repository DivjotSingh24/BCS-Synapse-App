import 'package:bcs/components/date.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        margin: EdgeInsets.all(size.width * 0.03),
        decoration: BoxDecoration(
          // color: const Color.fromARGB(255, 111, 0, 255),
          borderRadius: BorderRadius.circular(15),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Date(
              //   day: 'Tue',
              //   date: '04',
              // ),
              // Date(
              //   day: 'Wed',
              //   date: '05',
              // ),
              Date(
                day: 'Thu',
                date: '06',
              ),
              Date(
                day: 'Fri',
                date: '07',
                // color1: const Color.fromARGB(255, 53, 52, 52),
                textColor: Colors.white,
                gradientColors: [
                  const Color.fromARGB(255, 230, 102, 102),
                  const Color.fromARGB(255, 238, 57, 44),
                  Color.fromARGB(255, 65, 63, 63),
                  Colors.black,
                  Color.fromARGB(255, 65, 63, 63),
                  Colors.red,
                  Colors.redAccent,
                ],
                // color3: const Color.fromARGB(255, 159, 104, 207),
                verticalPadding: 0.045,
                isSelected: true,
              ),
              Date(
                day: 'Sat',
                date: '08',
                gradientColors: [
                  const Color.fromARGB(255, 230, 102, 102),
                  const Color.fromARGB(255, 238, 57, 44),
                  Color.fromARGB(255, 65, 63, 63),
                  Colors.black,
                  Color.fromARGB(255, 65, 63, 63),
                  Colors.red,
                  Colors.redAccent,
                ],
                // color1: const Color.fromARGB(255, 53, 52, 52),
                textColor: Colors.white,
                // color3: const Color.fromARGB(255, 159, 104, 207),
                verticalPadding: 0.045,
                isSelected: true,
              ),
              Date(
                day: 'Sun',
                date: '09',
                gradientColors: [
                  const Color.fromARGB(255, 230, 102, 102),
                  const Color.fromARGB(255, 238, 57, 44),
                  Color.fromARGB(255, 65, 63, 63),
                  Colors.black,
                  Color.fromARGB(255, 65, 63, 63),
                  Colors.red,
                  Colors.redAccent,
                ],
                // color1: const Color.fromARGB(255, 53, 52, 52),
                textColor: Colors.white,
                // color3: const Color.fromARGB(255, 159, 104, 207),
                verticalPadding: 0.045,
                isSelected: true,
              ),
              Date(
                day: 'Mon',
                date: '10',
              ),
              Date(
                day: 'Tue',
                date: '11',
              ),
              Date(
                day: 'Wed',
                date: '12',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
