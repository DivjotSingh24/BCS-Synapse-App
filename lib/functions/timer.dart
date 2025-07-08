
import 'package:flutter/material.dart';
import 'dart:async';

class CountdownTimerCard extends StatefulWidget {
  final Size size;
  final DateTime startTime;
  final DateTime endTime;

  const CountdownTimerCard({
    Key? key,
    required this.size,
    required this.startTime,
    required this.endTime,
  }) : super(key: key);

  @override
  _CountdownTimerCardState createState() => _CountdownTimerCardState();
}

class _CountdownTimerCardState extends State<CountdownTimerCard> {
  late Timer _timer;
  String eventText = "Upcoming Event";

  @override
  void initState() {
    super.initState();
    _updateEventText(); // Initial update
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateEventText();
    });
  }

  void _updateEventText() {
    DateTime now = DateTime.now();
    String newText;

    if (now.isBefore(widget.startTime)) {
      newText = "Upcoming Event";
    } else if (now.isBefore(DateTime(2025, 2, 8))) {
      newText = "SYNAPSE Day 1";
    } else if (now.isBefore(DateTime(2025, 2, 9))) {
      newText = "SYNAPSE Day 2";
    } else if (now.isBefore(DateTime(2025, 2, 10))) {
      newText = "SYNAPSE Day 3";
    } else {
      newText = "Event Finished";
    }

    if (newText != eventText) {
      setState(() {
        eventText = newText;
      });
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.6),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          eventText,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
