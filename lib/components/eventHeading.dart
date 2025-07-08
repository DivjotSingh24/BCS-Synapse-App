import 'package:flutter/material.dart';

class EventHeading extends StatelessWidget {
  const EventHeading({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.05,
          top: size.height * 0.002,
          bottom: size.width * 0.01,
        ),
        child: Text(
          "EVENTS",
          style: TextStyle(
            fontSize: size.height * 0.034,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 233, 229, 229),
          ),
        ),
      ),
    );
  }
}
