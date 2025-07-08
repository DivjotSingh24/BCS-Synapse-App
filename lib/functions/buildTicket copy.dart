import 'package:flutter/material.dart';

class TicketWidget extends StatelessWidget {
  final String eventName1;
  final String time1;
  final String venue1;
  final Widget page1;

  final String eventName2;
  final String time2;
  final String venue2;
  final Widget page2;

  final double topButtonPosition;
  final double bottomButtonPosition;
  final double right1;
  final double right2;

  const TicketWidget({
    super.key,
    required this.eventName1,
    required this.time1,
    required this.venue1,
    required this.page1,
    required this.eventName2,
    required this.time2,
    required this.venue2,
    required this.page2,
    required this.topButtonPosition,
    required this.bottomButtonPosition,
    required this.right1,
    required this.right2,
  });

  final Color defaultBackgroundColor = Colors.white;
  final Color defaultTextColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        buildBackgroundImage(size),
        buildTopContent(size, context),
        buildBottomContent(size, context),
        // buildButton(context, page1, topButtonPosition, defaultBackgroundColor,
        //     defaultTextColor, right1),
        // buildButton(context, page2, bottomButtonPosition, defaultTextColor,
        //     defaultBackgroundColor, right2),
      ],
    );
  }

  // Builds the background image
  Widget buildBackgroundImage(Size size) {
    return Padding(
      padding: EdgeInsets.zero,
      child: Image.asset(
        'assets/new2.PNG',
        width: size.width,
        fit: BoxFit.cover,
      ),
    );
  }

  // Builds the top content for event 1
  Widget buildTopContent(Size size, BuildContext context) {
    return Positioned(
        top: size.height * 0.08,
        left: size.width * 0.1,
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page1),
          ),
          child: buildContent(size, eventName1, time1, venue1),
        ));
  }

  // Builds the bottom content for event 2
  Widget buildBottomContent(Size size, BuildContext context) {
    return Positioned(
      bottom: size.height * 0.2,
      left: size.width * 0.075,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page2),
        ),
        child: buildContent(size, eventName2, time2, venue2),
      ),
    );
  }

  // General content builder for an event
  Widget buildContent(Size size, String eventName, String time, String venue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildEventText(eventName),
        buildEventText(time),
        buildEventText(venue),
      ],
    );
  }

  // Builds the "More" button with a dynamic position
  Widget buildButton(BuildContext context, Widget page, double position,
      Color bgColor, Color textColor, double right) {
    return Positioned(
      top: position,
      right: right,
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        ),
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            'More',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }

  // Builds a text widget for event details
  Widget buildEventText(String text) {
    return Text(
      text,
      style: textStyle(fontSize: 28, fontWeight: FontWeight.bold),
    );
  }

  // Reusable text style method
  TextStyle textStyle({
    required double fontSize,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: Colors.white,
      shadows: [
        Shadow(
          offset: const Offset(2, 2),
          blurRadius: 4.0,
          color: Colors.black.withOpacity(0.5),
        ),
      ],
    );
  }
}
