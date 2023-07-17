import 'package:flutter/material.dart';

class LeagueFixtures extends StatefulWidget {
  final String barTitle;

  const LeagueFixtures({
    Key? key,
    required this.barTitle,
  }) : super(key: key);
  @override
  State<LeagueFixtures> createState() => _LeagueFixturesState();
}

class _LeagueFixturesState extends State<LeagueFixtures> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.barTitle),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: null,
      );
}
