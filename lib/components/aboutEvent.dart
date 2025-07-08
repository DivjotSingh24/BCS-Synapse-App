

import 'package:flutter/material.dart';
import 'overlayWindow.dart';

class AboutEvent extends StatelessWidget {
  const AboutEvent({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                  right: size.height * 0.02,
                  left: size.height * 0.02,
                  bottom: size.height * 0.013,
                  top: size.height * 0.05),
              child: Container(
                height: size.height * 0.485,
                width: size.height * 0.4,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(185, 244, 240, 240).withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                ),
                child: Image.asset(
                  'assets/images/poster.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.024,
                  vertical: size.height * 0.013),
              child: Container(
                height: size.height * 0.17,
                width: double.infinity,
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(185, 244, 240, 240).withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "7",
                          style: TextStyle(
                              fontSize: size.height * 0.041,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "8",
                          style: TextStyle(
                              fontSize: size.height * 0.041,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "9",
                          style: TextStyle(
                              fontSize: size.height * 0.041,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        3,
                        (_) => Text(
                          "Feb",
                          style: TextStyle(
                            fontSize: size.height * 0.035,
                            fontWeight: FontWeight.w500,
                            color: const Color.fromARGB(255, 162, 46, 44),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: size.height * 0.023,
                  vertical: size.height * 0.013),
              child: Container(
                height: size.height * 0.19,
                width: double.infinity,
                decoration: BoxDecoration(
                  color:
                      const Color.fromARGB(255, 244, 240, 240).withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(18)),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.height * 0.019,
                      vertical: size.height * 0.024),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          "Enter a world where thoughts are no longer your own, and the boundaries of the mind blur into a haunting dreamscape..."
                          "Will you unravel the truth hidden in the folds of this ethereal dream, or will you become ensnared in a mind that conceals its darkest enigmas?",
                          style: TextStyle(
                            fontSize: size.height * 0.021,
                            color: Colors.white,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          onTap: () => OverlayScreen.showOverlay(context),
                          child: Padding(
                            padding: EdgeInsets.only(top: size.height * 0.008),
                            child: Text(
                              "More",
                              style: TextStyle(
                                color: const Color.fromARGB(255, 162, 46, 44),
                                fontSize: size.height * 0.024,
                                fontWeight: FontWeight.w500,
                                // decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: size.height * 0.51,
          left: size.width * 0.5 - size.height * 0.105,
          child: Container(
            height: size.height * 0.07,
            width: size.height * 0.21,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 162, 46, 44),
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              border: Border.all(
                color: Colors.black,
                width: size.height * 0.007,
              ),
            ),
            child: Center(
              child: Text(
                "Dates",
                style: TextStyle(
                    fontSize: size.height * 0.03,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        Positioned(
          top: size.height * 0.708,
          left: size.width * 0.5 - size.height * 0.105,
          child: Container(
            height: size.height * 0.07,
            width: size.height * 0.21,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 222, 220, 220),
              borderRadius: const BorderRadius.all(Radius.circular(18)),
              border: Border.all(
                color: Colors.black,
                width: size.height * 0.007,
              ),
            ),
            child: Center(
              child: Text(
                "Event Details",
                style: TextStyle(
                    fontSize: size.height * 0.027,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
