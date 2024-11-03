import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      home: Column(children: [
    NewWidget(
      lable: "OOP",
      col: Colors.blue.shade300,
      col1: Colors.blue.shade900,
    ),
    NewWidget(
      lable: "DART",
      col: Colors.blue.shade300,
      col1: Colors.blue.shade900,
    ),
    NewWidget(
      lable: "FLUTTER",
      col: Colors.blue.shade300,
      col1: Colors.blue.shade900,
    ),
  ])));
}

class NewWidget extends StatelessWidget {
  final String lable;
  final Color col;
  final Color col1;
  const NewWidget(
      {super.key, required this.lable, required this.col, required this.col1});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Container(
          margin: const EdgeInsets.all(30),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(colors: [col, col1])),
          child: Center(
            child: Text(
              lable,
              style: const TextStyle(
                  color: Colors.white, decoration: TextDecoration.none),
            ),
          ),
        ),
      ]),
    );
  }
}
