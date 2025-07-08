import 'package:flutter/material.dart';

class Date extends StatelessWidget {
  final String day;
  final String date;
  final List<Color>? gradientColors;
  final Color defaultColor;
  final Color textColor;
  final double verticalPadding;
  final bool isSelected;
  final String? backgroundImage;

  const Date({
    super.key,
    required this.day,
    required this.date,
    this.gradientColors,
    this.defaultColor = Colors.grey,
    this.textColor = Colors.white,
    this.verticalPadding = 0.03,
    this.isSelected = false,
    this.backgroundImage = "assets/images/img.jpg",
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(right: size.width * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: isSelected
            ? null
            : LinearGradient(
                colors: gradientColors ??
                    [
                      const Color.fromARGB(255, 43, 42, 42),
                      const Color.fromARGB(255, 44, 44, 44),
                    ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
        image: isSelected && backgroundImage != null
            ? DecorationImage(
                image: AssetImage(backgroundImage!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.02,
        vertical: size.height * verticalPadding,
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: size.width * 0.12,
                child: Text(
                  date,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: size.width * 0.06,
                    color: textColor,
                  ),
                ),
              ),
              SizedBox(
                width: size.width * 0.12,
                child: Text(
                  day,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.width * 0.045,
                    color: textColor.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
