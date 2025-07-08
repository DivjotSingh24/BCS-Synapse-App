import 'package:flutter/material.dart';

class TrailerHeading extends StatelessWidget {
  const TrailerHeading({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.052,
          top: size.height * 0.028,
        ),
        child: Text(
          "TRAILER",
          style: TextStyle(
            fontSize: size.height * 0.035,
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 246, 44, 44),
          ),
        ),
      ),
    );
  }
}
