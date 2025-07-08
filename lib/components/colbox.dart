import 'package:flutter/material.dart';

class colBox extends StatelessWidget {
  final String date;
  final Widget Box;
  const colBox({
    super.key,
    required this.date,
    required this.Box,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                date,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                ),
              ),
              Box,
            ],
          ),
        ),
      ),
    );
  }
}
