import 'package:flutter/material.dart';
import 'package:flutter_football_app/league_files/league_fixtures_page.dart';
// import 'api_data.dart';

class Fixtures extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final Map<String, dynamic> searchedItem;
  const Fixtures({super.key, required this.searchedItem});

  @override
  Widget build(BuildContext context) {
    // final fixtureData = getData(searchedItem, 'fixtures');
    return searchedItem.containsKey('games')
        ? FixtureBuild(fixtureData: searchedItem['games'])
        : const Center(
            child: Text(
            'No Games Found',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ));
  }
}

class FixtureBuild extends StatelessWidget {
  const FixtureBuild({super.key, required this.fixtureData});
  final List fixtureData;
  @override
  Widget build(BuildContext context) {
    var fixtureDates = <String>{};
    for (var date in fixtureData) {
      fixtureDates.add(date['date'] as String);
    }
    return SingleChildScrollView(
        child: Column(
      children: [
        ListView.builder(
            shrinkWrap: true,
            itemCount: fixtureDates.length,
            itemBuilder: (context, index) {
              return FixtureBody(
                  date: fixtureDates.elementAt(index),
                  fixtureData: fixtureData);
            })
      ],
    ));
  }
}

class FixtureBody extends StatelessWidget {
  final String date;
  final List fixtureData;
  const FixtureBody({super.key, required this.date, required this.fixtureData});

  @override
  Widget build(BuildContext context) {
    List fixtureDetails = [];
    for (var data in fixtureData) {
      if (data['date'] as String == date) {
        fixtureDetails.add(data);
      }
    }
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          color: const Color.fromARGB(255, 254, 126, 27),
          child: Center(
              child: Text(
            date,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: fixtureDetails.length,
            itemBuilder: (context, index) {
              return FixtureDetails(fixtureDetails: fixtureDetails[index]);
            })
      ],
    );
  }
}

class FixtureDetails extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final fixtureDetails;
  const FixtureDetails({super.key, required this.fixtureDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TeamDetails(
            teamName: fixtureDetails['teams'][0]['name'] as String,
            teamThumbnail: fixtureDetails['teams'][0]['thumbnail'] as String? ??
                'images/generics/genericTeamLogo.png',
          ),
          MatchDetails(fixtureDetails: fixtureDetails),
          TeamDetails(
            teamName: fixtureDetails['teams'][1]['name'] as String,
            teamThumbnail: fixtureDetails['teams'][1]['thumbnail'] as String? ??
                'images/generics/genericTeamLogo.png',
          ),
        ],
      ),
    );
  }
}

class MatchDetails extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final fixtureDetails;
  const MatchDetails({super.key, required this.fixtureDetails});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          fixtureDetails['time'] as String,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        Text(
          fixtureDetails.containsKey('status')
              ? fixtureDetails['status'] as String
              : fixtureDetails['stadium'] as String? ?? 'TBA',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class TeamDetails extends StatelessWidget {
  final String teamName;
  final String teamThumbnail;

  const TeamDetails(
      {super.key, required this.teamName, required this.teamThumbnail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LeagueFixtures(
                            searchedItem: teamName,
                          )));
            },
            child: Text(
              teamName,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: teamThumbnail.contains('images/generics/')
              ? Image.asset(
                  teamThumbnail,
                  width: 30,
                  height: 30,
                )
              : Image.network(
                  teamThumbnail,
                  width: 30,
                  height: 30,
                ),
        )
      ],
    );
  }
}
