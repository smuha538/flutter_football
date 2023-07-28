import 'package:flutter/material.dart';
import 'package:flutter_football_app/league_files/league_helpers/api_data.dart';
import 'package:flutter_football_app/league_files/league_helpers/league_fixtures.dart';

class LeagueFixtures extends StatefulWidget {
  final String searchedItem;

  const LeagueFixtures({
    Key? key,
    required this.searchedItem,
  }) : super(key: key);

  @override
  State<LeagueFixtures> createState() => _LeagueFixturesState();
}

class _LeagueFixturesState extends State<LeagueFixtures> {
  late Future fixtureData;

  @override
  void initState() {
    super.initState();
    fixtureData = getData(widget.searchedItem, 'fixtures');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(widget.searchedItem),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 104, 3),
      ),
      body: FutureBuilder(
        future: fixtureData,
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            return Fixtures(searchedItem: snapshot.data);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ));
}
