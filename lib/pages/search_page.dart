import 'package:flutter/material.dart';
import 'package:flutter_football_app/main.dart';

class Search extends StatefulWidget {
  const Search({super.key, required});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
          centerTitle: true,
          backgroundColor: const Color.fromARGB(255, 107, 231, 146),
        ),
        body: const Text('test'),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 1,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.sports_soccer), label: 'Leagues'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          ],
          onTap: (int index) {
            // setState(() {
            //   currentIndex = index;
            // });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Leagues()));
          },
        ));
  }
}
