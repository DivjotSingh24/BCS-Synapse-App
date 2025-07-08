// import 'dart:ui';
// import 'package:flutter/material.dart';

// class OverlayScreen {
//   static void showOverlay(BuildContext context) {
//     final size = MediaQuery.of(context).size;

//     final overlay = Overlay.of(context);
//     late OverlayEntry overlayEntry;

//     overlayEntry = OverlayEntry(
//       builder: (context) => Stack(
//         children: [
//           Positioned.fill(
//             child: BackdropFilter(
//               filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//               child: Container(
//                 color: Colors.black.withOpacity(0.5),
//               ),
//             ),
//           ),
//           Center(
//             child: Material(
//               color: Colors.transparent,
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.85,
//                 padding: const EdgeInsets.all(16),
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(90, 8, 4, 16),
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black26,
//                       blurRadius: 10,
//                       spreadRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.6,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             SizedBox(
//                               width: size.width * 0.12,
//                             ),
//                             Text(
//                               "Event Details",
//                               style: TextStyle(
//                                 fontSize: size.height * 0.038,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color.fromARGB(255, 247, 47, 47),
//                               ),
//                             ),
//                             SizedBox(height: size.height * 0.05),
//                             Center(
//                               child: Stack(children: [
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.close,
//                                     color: Colors.grey,
//                                   ),
//                                   onPressed: () {
//                                     overlayEntry.remove();
//                                   },
//                                 ),
//                               ]),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: size.height * 0.018),
//                         Text(
//                           "Enter a world where thoughts are no longer your own, and the boundaries of the mind blur into a haunting dreamscape. Dive into the enigmatic realm of The Keeper, a fractured psyche where shadows whisper and secrets pulse beneath the surface. Within this surreal labyrinth lies an undiscovered force-dark, elusive, and ever-watchful.Will you unravel the truth hidden in the folds of this ethereal dream, or will you become ensnared in a mind that conceals its darkest enigmas? Prepare for an immersive journey where light fractures, shadows dance, and every step brings you closer to the heart of a mystery that defies reality.The dream awaits. Will you dare to enter?",
//                           style: TextStyle(
//                               fontSize: size.height * 0.0215,
//                               color: Colors.white),
//                           textAlign: TextAlign.center,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );

//     overlay.insert(overlayEntry);
//   }
// }
import 'dart:ui';
import 'package:flutter/material.dart';

class OverlayScreen {
  static void showOverlay(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Background blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),
          ),
          // Overlay content
          Center(
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: size.width * 0.85,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(90, 8, 4, 16),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title and close button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 40), // Spacer
                        Text(
                          "Event Details",
                          style: TextStyle(
                            fontSize: size.height * 0.038,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 247, 47, 47),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.grey),
                          onPressed: () => overlayEntry.remove(),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.018),
                    // Event Description
                    SingleChildScrollView(
                      child: Text(
                        "Enter a world where thoughts are no longer your own, and the boundaries of the mind blur into a haunting dreamscape. Dive into the enigmatic realm of The Keeper, a fractured psyche where shadows whisper and secrets pulse beneath the surface. Within this surreal labyrinth lies an undiscovered force-dark, elusive, and ever-watchful.Will you unravel the truth hidden in the folds of this ethereal dream, or will you become ensnared in a mind that conceals its darkest enigmas? Prepare for an immersive journey where light fractures, shadows dance, and every step brings you closer to the heart of a mystery that defies reality.The dream awaits. Will you dare to enter?",
                        style: TextStyle(
                          fontSize: size.height * 0.0215,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(overlayEntry);
  }
}
