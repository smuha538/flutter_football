import 'package:flutter/material.dart';

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
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Leagues'),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            body: Column(
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
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   height: 50,
                //   color: Colors.grey,
                //   child: const Center(
                //       child: Text(
                //     'European Leagues',
                //     style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                //   )),
                // ),
                Column(
                  children: [
                    InkWell(
                      onTap: () {
                        print('Premier League');
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
                        print('La Liga');
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
                        print('Serie A');
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
                        print('Bundesliga');
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
                        print('Ligue 1');
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
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: currentIndex,
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports_soccer), label: 'Leagues'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.public), label: 'International'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.login), label: 'Login'),
              ],
              onTap: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
            )));
  }
}
