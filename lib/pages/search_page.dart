import 'package:flutter/material.dart';
import 'package:flutter_football_app/pages/search_result_page.dart';

class Search extends StatelessWidget {
  Search({super.key, required});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 107, 231, 146),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            SearchBar(
              backgroundColor: const MaterialStatePropertyAll(Colors.amber),
              leading: IconButton(
                  onPressed: () {
                    if (searchController.text.isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SearchResult(
                                  searchedItem: searchController.text)));
                    }
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
              controller: searchController,
              hintText: 'Search for a Player or a Team',
              hintStyle: const MaterialStatePropertyAll(
                  TextStyle(color: Colors.white)),
            )
          ]),
        ),
        //Image from www.vecteezy.com
        Expanded(child: Image.asset('images/generics/football.png'))
      ]),
    );
  }
}
