import 'package:flutter/material.dart';
import 'package:flutter_football_app/league_files/league_helpers/league_list.dart';
import 'package:flutter_football_app/league_files/league_helpers/league_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Leagues());
  }
}

class Leagues extends StatelessWidget {
  Leagues({super.key});
  final int leagueIndex = 0;
  final selectedIndexNotifier = ValueNotifier<int?>(0);
  final List leagueRegions = ['European', 'American', 'African', 'Asian'];
  final List leagueImages = [
    [
      'images/prem.png',
      'images/laliga.png',
      'images/serie.png',
      'images/bun.png',
      'images/ligue.png'
    ],
    [
      'images/brazil.png',
      'images/argentina.png',
      'images/agulia.png',
      'images/para.png',
      'images/mx.png',
      'images/mls.png',
      'images/costa.png'
    ],
    ['images/egypt.png'],
    [
      'images/k1.png',
      'images/persian.png',
      'images/j1.png',
      'images/csl.png',
      'images/npl.png'
    ]
  ];
  final List leagueNames = [
    ['Premier League', 'La Liga', 'Serie A', 'Bundesliga', 'Ligue 1'],
    [
      'Campeonato Brasileiro Serie A',
      'Argentine Primera Division',
      'Categoria Primera A',
      'Paraguay Primera Division',
      'Liga MX',
      'MLS',
      'Liga FPD'
    ],
    ['Egypt Premier League'],
    [
      'K League 1',
      'Persian Gulf Pro League',
      'J1 League',
      'Chinese Super League',
      'National Premier Leagues Western Australia'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Leagues'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 107, 231, 146),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color.fromARGB(255, 236, 232, 232),
              height: 50,
              child: ValueListenableBuilder<int?>(
                valueListenable: selectedIndexNotifier,
                builder: (_, selectedIndex, __) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: leagueRegions.length,
                    itemBuilder: (context, index) {
                      return LeagueOptions(
                          key: ValueKey(index),
                          name: leagueRegions[index],
                          isSelected: selectedIndex == index,
                          onPressed: () => selectedIndex == index
                              ? selectedIndexNotifier.value = null
                              : selectedIndexNotifier.value = index);
                    }),
              ),
            ),
            ValueListenableBuilder<int?>(
                valueListenable: selectedIndexNotifier,
                builder: (_, selectedIndex, __) => ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: leagueNames[selectedIndex ?? 0].length,
                    itemBuilder: (context, index) {
                      return LeagueList(
                          leagueImages: leagueImages[selectedIndex ?? 0][index],
                          leagueNames: leagueNames[selectedIndex ?? 0][index]);
                    })),
          ],
        ),
      ),
    );
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
  }
}
