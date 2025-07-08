import 'package:flutter/material.dart';
import 'package:bcs/screens/first.dart';

class EventBox extends StatelessWidget {
  final String eventName;
  final String location;
  final String date;
  final String month;
  final String imagePath;
  // final Widget page;

  const EventBox({
    super.key,
    required this.eventName,
    required this.location,
    required this.date,
    required this.month,
    required this.imagePath,
    // required this.page,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Widget getNavigationPage() {
      switch (eventName) {
        case 'Zone Wars':
          return First(
              title: "Zone Wars",
              day: "8th Feb",
              // time: "10:00 AM - 05:00 PM",
              place: "LMTSM Campus",
              image: 'assets/images/war_z.jpg',
              about:
                  "The battlefield is set. The stakes are high. Zone Wars is not just a game—it’s a territory battle where only the smartest and strongest survive. Every decision counts, every second matters. Will you hold your ground or risk it all?Face-offs strike when you least expect them. You’ll have only moments to secure your zone, rally your team, and steal victory from your rivals. Strategy is your weapon, speed is your shield—how you play will decide your fate.",
              rulebook: [
                "1. Every participant is supposed to bring their laptops (fully charged), where they launch a game on a website.",
                "2. There will be X pools in total Y zones per pool. Every team will be designated one zone. (Depends on the number of teams that attend this event).",
                "3. The event is going to be point-based. A set amount of teams globally will qualify for the next event.",
                "4. There are 2 ways of earning points: Completing tasks & Face-offs.",
                "5. Every team member will be worth points. No. of points a person has = (Team points), Every task is worth +4 points.",
                "6. There is no restriction on how many members are solving a task in real life; it can range from 1-4.",
                "7. The member(s) sitting in the zone will be playing a video game to help their teammates solving the tasks in real life.",
                "8. It is recommended that at least one person stays in the zone as the face-offs will be announced in the pool location itself.",
                "9. It’s a time-bound event, hence the teams with the most points at the end of 3 hours, regardless of tasks completed or face-offs won, will qualify."
              ]);
        case 'Mirage':
          return First(
            title: "Mirage",
            day: "9th Feb",
            // time: "10:00 AM - 05:00 PM",
            place: "Academic Building",
            image: 'assets/images/mirage.jpeg.jpg',
            about:
                "You’ve navigated the labyrinth of dreams, deciphered the cryptic clues, and now stand at the threshold of The Core—the heart of The Keeper’s mind. Here, reality crumbles, and the shadows whisper truths too dangerous to know. Assemble the fragments of the hidden code, confront the unseen force that guards it, and make your choice: uncover the truth and risk the mind’s collapse, or protect the fragile balance and leave the secrets buried. But remember: in The Core, nothing is as it seems, and every step could be your last.",
            rulebook: [
              "1. Top 6 teams will qualify for this final round.",
              "2. All team members are required to submit their mobile phones before starting the round.",
              "3. The 4 rooms represent four different personalities, and the teams have to explore the rooms riddled with clues and misdirects to get a puzzle piece from each room that makes up a name.",
              "4. The 4 pieces thus collected would reveal the name of the fifth personality.",
              "5. Any sort of unethical behavior during the event would lead to strict action by the Backslash Team and immediate disqualification from the event."
            ],
          );
        case 'Search and Destroy':
          return First(
            title: "Search and Destroy",
            day: "8th Feb",
            // time: "10:00 AM - 05:00 PM",
            place: "Academic building",
            image: 'assets/images/bgoutside.jpeg',
            about:
                "This is not just a battle—it’s a test of strategy, precision, and survival. Each team will step into the roles of both Attackers and Defenders, switching sides after every round. As Attackers, plant the bomb and outmaneuver your opponents. As Defenders, hold your ground and defuse the threat before time runs out. With Nerf guns locked and hit markers active, every move counts. One shot could mean elimination, one mistake could cost you victory. The team with the most successful plays, sharpest reflexes, and strongest coordination will claim dominance. No second chances. No room for error. Will you strike first or fall in the crossfire?",
            rulebook: [
              "1. The game consists of two teams: Attackers and Defenders.",
              "2. Attackers must plant a bomb at one of two designated bomb sites, while Defenders must prevent it or defuse it if planted.",
              "3. Each player is equipped with a Nerf gun, ammunition, a hit marker worn on the head, and a face shield for safety.",
              "4. A player is eliminated if their hit marker is hit by a Nerf bullet or damaged in any way.",
              "5. The game consists of two rounds, with teams switching roles after each round.",
              "6. The team with the most successful plant and defusal attempts, or the most kills and least deaths, wins.",
              "7. Backslash holds full authority to disqualify teams for rule violations or unsportsmanlike behavior.",
              "8. Teams must follow all rules and exhibit sportsmanship throughout the game."
            ],
          );
        default:
          return First(
            title: "Evangelion",
            day: "7th Feb",
            // time: "10:00 AM - 05:00 PM",
            place: "Auditorium",
            image: 'assets/images/cryptic.jpg',
            about:
                "The mind is a labyrinth of dreams, where reality bends and secrets are buried deep. Enter the fractured dreamscape of The Keeper, a realm where four surreal worlds guard fragments of a hidden code. Decode cryptic puzzles, navigate shifting realities, and piece together clues hidden in innocence, strategy, ancient mysteries, and scientific obsession. But beware: the deeper you delve, the more the dream twists, and the closer you come to awakening something that should have stayed hidden",
            rulebook: [
              "1. This is an online cryptic hunt with questions on encryption, decryption, general awareness, movies, etc.",
              "2. There are 15 questions with a points-based performance system.",
              "3. No sharing of answers or clues between teams.",
              "4. Participants are not allowed to leave the auditorium without permission from the Backslash team. There will be no elimination in this round.",
              "5. Day scholars may participate online from home. Keep the auditorium neat and clean.",
              "6. Any unethical behavior or interference with the website will lead to strict action and immediate disqualification.",
              "7. Backslash team holds authority over all decisions.",
              "8. For any further doubts, please contact Team Backslash.",
            ],
          );
      }
    }

    return InkWell(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => getNavigationPage()),
      ),
      child: Padding(
        padding: EdgeInsets.all(size.height * 0.01),
        child: Container(
          height: size.height * 0.61,
          width: size.height * 0.26,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                color: Colors.black.withOpacity(0.4),
                colorBlendMode: BlendMode.darken,
                fit: BoxFit.fill,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                top: size.height * 0.0068,
                left: size.width * 0.013,
                child: Text(
                  eventName,
                  style: TextStyle(
                    fontSize: size.height * 0.025,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: size.height * 0.007,
                left: size.width * 0.011,
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white,
                      size: size.height * 0.023,
                    ),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: size.height * 0.018,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: size.height * 0.0074,
                right: size.width * 0.015,
                child: Container(
                  height: size.height * 0.05,
                  width: size.height * 0.035,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 31, 15),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  child: Column(
                    children: [
                      Text(
                        date,
                        style: TextStyle(
                          fontSize: size.height * 0.018,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        month,
                        style: TextStyle(
                          fontSize: size.height * 0.014,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
