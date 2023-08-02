import 'package:flutter/material.dart';
import 'package:flutter_football_app/league_files/league_and_player_helpers/api_data.dart';
import 'package:flutter_football_app/league_files/league_and_player_helpers/league_fixtures.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key, required this.searchedItem});
  final String searchedItem;

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  late Future fixtureData;

  @override
  void initState() {
    super.initState();
    fixtureData = getData(widget.searchedItem, '');
  }

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: const Text('Results'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 1, 167, 255),
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
