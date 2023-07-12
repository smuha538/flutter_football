import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
            body: null,
            bottomNavigationBar:
                BottomNavigationBar(currentIndex: 0, items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.sports_soccer), label: 'League'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.public), label: 'International'),
              BottomNavigationBarItem(icon: Icon(Icons.login), label: 'Login')
            ])));
  }
}
