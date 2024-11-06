import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My Hobbies'),
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              NewWidget(
                  color: Colors.green,
                  text: "Travelling",
                  icon1: Icons.travel_explore),
              SizedBox(height: 10),
              NewWidget(
                  color: Colors.blueGrey,
                  text: "Skating",
                  icon1: Icons.directions_walk),
            ],
          ),
        ),
      ),
    ),
  );
}

class NewWidget extends StatelessWidget {
  final Color color;
  final String text;
  final IconData icon1;
  const NewWidget(
      {super.key,
      required this.color,
      required this.text,
      required this.icon1});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Icon(icon1, color: Colors.white),
            ),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
