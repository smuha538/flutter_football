import 'package:flutter/material.dart';
import 'package:flutter_football_app/league_files/league_fixtures.dart';

class LeagueList extends StatelessWidget {
  final String leagueImages;
  final String leagueNames;
  const LeagueList(
      {super.key, required this.leagueImages, required this.leagueNames});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LeagueFixtures(
                        barTitle: leagueNames,
                      )));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              leagueImages,
              width: 120,
              height: 120,
            ),
            const SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
