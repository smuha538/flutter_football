import 'package:flutter/material.dart';
import 'package:flutter_football_app/pages/league_page.dart';
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
        debugShowCheckedModeBanner: false, home: MainPage());
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [Leagues(), Search()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: GNav(
            backgroundColor: const Color.fromARGB(255, 107, 231, 146),
            tabBackgroundColor: const Color.fromARGB(93, 41, 184, 86),
            padding: const EdgeInsets.all(10),
            onTabChange: (index) {
              setState(() {
                currentIndex = index;
              });
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
