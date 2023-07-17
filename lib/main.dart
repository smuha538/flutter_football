import 'package:flutter/material.dart';
import 'package:flutter_football_app/league_fixtures.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Leagues());
  }
}

class Leagues extends StatelessWidget {
  const Leagues({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leagues'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 50,
              color: Colors.grey,
              child: const Center(
                  child: Text(
                'European Leagues',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              )),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LeagueFixtures(
                                  barTitle: 'Premier League',
                                )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/prem.png',
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LeagueFixtures(
                                  barTitle: 'La Liga',
                                )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/laliga.png',
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LeagueFixtures(
                                  barTitle: 'Serie A',
                                )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/serie.png',
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LeagueFixtures(
                                  barTitle: 'Bundesliga',
                                )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/bun.png',
                        width: 140,
                        height: 140,
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LeagueFixtures(
                                  barTitle: 'Ligue 1',
                                )));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/ligue.png',
                        width: 120,
                        height: 120,
                      ),
                      const SizedBox(
                        height: 40,
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: currentIndex,
      //   items: const [
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.sports_soccer), label: 'Leagues'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.public), label: 'International'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.login), label: 'Login'),
      //   ],
      //   onTap: (int index) {
      //     setState(() {
      //       currentIndex = index;
      //     });
      //   },
      // )
    );
  }
}
