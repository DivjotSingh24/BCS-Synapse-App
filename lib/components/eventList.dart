import 'package:bcs/functions/buildEventBox.dart';
import 'package:flutter/material.dart';

class EventList extends StatelessWidget {
  const EventList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      child: SizedBox(
        height: size.height * 0.175,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            EventBox(
              eventName: "Evangelion",
              location: "Auditorium",
              date: "7",
              month: "feb",
              imagePath: 'assets/images/crypticoutside.jpeg',
            ),
            EventBox(
              eventName: "Zone Wars",
              location: "LMTSM Campus",
              date: "8",
              month: "feb",
              imagePath: 'assets/images/warzoneoutside.jpeg',
            ),
            EventBox(
              eventName: "Search and Destroy",
              location: "Academic building",
              date: "8",
              month: "feb",
              imagePath: 'assets/images/bgoutside.jpeg',
            ),
            EventBox(
              eventName: "Mirage",
              location: "Academic Building",
              date: "9",
              month: "feb",
              imagePath: 'assets/images/mirage.jpeg.jpg',
            ),
          ],
        ),
      ),
    );
  }
}
