import 'package:flutter/material.dart';

class LeagueFixtures extends StatefulWidget {
  final String barTitle;

  const LeagueFixtures({
    Key? key,
    required this.barTitle,
  }) : super(key: key);
  @override
  State<LeagueFixtures> createState() => _LeagueFixturesState();
}

class _LeagueFixturesState extends State<LeagueFixtures> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(widget.barTitle),
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
                  'Aug 12',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                )),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LeagueFixtures(
                                            barTitle: 'Premier League',
                                          )));
                            },
                            child: const Text(
                              'Arsenal',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Image.network(
                            'https://serpapi.com/searches/64b3c23eca968f4ecea5491f/images/61b71d7cfb3ee4d4702f7c66b9a856a60b7747a4e1345b9580902877ef7d67725ba49e02e39fce7a21e4130440722f0f.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                        const Column(
                          children: [
                            Text(
                              '6:30 AM',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            Text(
                              'FT: 2-0',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Image.network(
                            'https://serpapi.com/searches/64b3c23eca968f4ecea5491f/images/61b71d7cfb3ee4d4702f7c66b9a856a6e54825fd5213d2def074e31a2706b53d4313e93a86459e057a3edb5b6ad33840.png',
                            width: 30,
                            height: 30,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LeagueFixtures(
                                            barTitle: 'Premier League',
                                          )));
                            },
                            child: const Text(
                              'Everton',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
