import 'package:flutter/material.dart';

class PlayerBuilder extends StatelessWidget {
  const PlayerBuilder({super.key, required this.playerData});
  // ignore: prefer_typing_uninitialized_variables
  final playerData;
  @override
  Widget build(BuildContext context) {
    return PlayerContainer(playerData: playerData);
  }
}

class PlayerContainer extends StatelessWidget {
  const PlayerContainer({super.key, required this.playerData});
  // ignore: prefer_typing_uninitialized_variables
  final playerData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PlayerBanner(
              title: playerData["title"],
              colour: const Color.fromARGB(255, 41, 50, 65)),
          const Divider(
            height: 1,
            color: Colors.blue,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: playerData['tables'].length,
              itemBuilder: (context, index) {
                return PlayerDetails(
                    playerDetails: playerData['tables'][index]);
              })
        ],
      ),
    );
  }
}

class PlayerDetails extends StatelessWidget {
  const PlayerDetails({super.key, required this.playerDetails});
  // ignore: prefer_typing_uninitialized_variables
  final playerDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlayerBanner(
            title: playerDetails['title'],
            colour: const Color.fromARGB(255, 61, 90, 128)),
        ListView.builder(
            shrinkWrap: true,
            itemCount: playerDetails['games'].length,
            itemBuilder: (context, index) {
              return PlayerStats(playerStats: playerDetails['games'][index]);
            })
      ],
    );
  }
}

class PlayerStats extends StatelessWidget {
  const PlayerStats({super.key, required this.playerStats});
// ignore: prefer_typing_uninitialized_variables
  final playerStats;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 224, 251, 252),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 238, 108, 77),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Column(
            children: [
              Stats(
                  text:
                      '${playerStats["league"]["name"]} - ${playerStats["league"]["year"]}',
                  customPadding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                  fontSize: 35,
                  colour: const Color.fromARGB(255, 41, 50, 65)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stats(
                      text: 'Matches: ${playerStats["matches"]}',
                      customPadding: const EdgeInsets.only(
                          right: 20.0, top: 8.0, bottom: 8.0, left: 8.0)),
                  Stats(
                      text: 'Goals: ${playerStats["goals"]}',
                      customPadding: const EdgeInsets.only(
                          left: 20.0, top: 8.0, bottom: 8.0, right: 8.0)),
                  Stats(
                      text: 'Assists: ${playerStats["assists"]}',
                      customPadding: const EdgeInsets.only(
                          left: 20.0, top: 8.0, bottom: 8.0, right: 8.0)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stats(
                      text: 'Yellow Cards: ${playerStats["yellow_cards"]}',
                      customPadding: const EdgeInsets.only(
                          top: 8.0, right: 20.0, bottom: 8.0)),
                  Stats(
                      text: 'Red Cards: ${playerStats["red_cards"]}',
                      customPadding: const EdgeInsets.only(
                          top: 8.0, left: 20.0, bottom: 8.0)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Stats extends StatelessWidget {
  const Stats(
      {super.key,
      required this.text,
      required this.customPadding,
      this.colour = Colors.black,
      this.fontSize = 18});
  final String text;
  final EdgeInsets customPadding;
  final Color colour;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: customPadding,
      child: Text(
        text,
        style: TextStyle(fontFamily: 'VT323', fontSize: fontSize),
      ),
    );
  }
}

class PlayerBanner extends StatelessWidget {
  const PlayerBanner({super.key, required this.title, required this.colour});
  final String title;
  final Color colour;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 152, 193, 217),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              color: colour,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  fontFamily: 'Righteous', fontSize: 25, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
