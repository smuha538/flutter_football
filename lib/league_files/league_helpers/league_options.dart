import 'package:flutter/material.dart';

class LeagueOptions extends StatelessWidget {
  const LeagueOptions({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onPressed,
  });
  final String name;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 80,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(isSelected
                  ? Colors.purple
                  : const Color.fromARGB(255, 85, 221, 224)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ))),
          onPressed: onPressed,
          child: Center(
              child: Text(
            name,
            style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: isSelected ? Colors.white : Colors.black),
          )),
        ),
      ),
    );
  }
}
