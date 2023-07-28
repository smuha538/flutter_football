import 'package:flutter/material.dart';
import 'package:flutter_football_app/league_files/league_helpers/league_list.dart';
import 'package:flutter_football_app/league_files/league_helpers/league_options.dart';
import 'package:flutter_football_app/pages/search_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: Leagues());
  }
}

class Leagues extends StatefulWidget {
  const Leagues({super.key});

  @override
  State<Leagues> createState() => _LeaguesState();
}

class _LeaguesState extends State<Leagues> {
  final int leagueIndex = 0;
  final selectedIndexNotifier = ValueNotifier<int?>(0);
  final List leagueRegions = ['European', 'American', 'African', 'Asian'];
  final List leagueImages = [
    [
      'images/leagues/prem.png',
      'images/leagues/laliga.png',
      'images/leagues/serie.png',
      'images/leagues/bun.png',
      'images/leagues/ligue.png'
    ],
    [
      'images/leagues/brazil.png',
      'images/leagues/argentina.png',
      'images/leagues/agulia.png',
      'images/leagues/para.png',
      'images/leagues/mx.png',
      'images/leagues/mls.png',
      'images/leagues/costa.png'
    ],
    ['images/leagues/egypt.png'],
    [
      'images/leagues/k1.png',
      'images/leagues/persian.png',
      'images/leagues/j1.png',
      'images/leagues/csl.png',
      'images/leagues/npl.png'
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
          title: const Text('Football Panic'),
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
                            leagueImages: leagueImages[selectedIndex ?? 0]
                                [index],
                            leagueNames: leagueNames[selectedIndex ?? 0]
                                [index]);
                      })),
            ],
          ),
        ),
        bottomNavigationBar: GNav(
            backgroundColor: const Color.fromARGB(255, 107, 231, 146),
            tabBackgroundColor: const Color.fromARGB(93, 41, 184, 86),
            padding: const EdgeInsets.all(10),
            onTabChange: (index) {
              print(index);
            },
            tabs: const [
              GButton(
                icon: Icons.sports_soccer,
                text: 'Leagues',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              )
            ]));
  }
}
