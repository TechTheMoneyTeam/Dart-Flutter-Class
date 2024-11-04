import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.grey,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            NewWidget(date: "Monday",icon1: Icons.cloud,degree: "30 Celsius",),
            NewWidget(date: "Tuesday",icon1: Icons.sunny,degree: "20 Celsius",),
            NewWidget(date: "Wednesday",icon1: Icons.sunny,degree: "10 Celsius",),
            NewWidget(date: "Thursday",icon1: Icons.cloud,degree: "14 Celsius",),
            NewWidget(date: "Friday",icon1: Icons.sunny_snowing,degree: "40 Celsius",),
            NewWidget(date: "Saturday",icon1: Icons.cloud,degree: "32 Celsius",),
            NewWidget(date: "Sunday",icon1: Icons.sunny,degree: "20 Celsius",),

          ],
        ),
      ),
    ),
  ));
}

class NewWidget extends StatelessWidget {
  final String date;
  final String degree;
  final IconData icon1;
 
  const NewWidget({
    required this.date,
    required this.degree,
    required this.icon1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon1),
            Text(date),
            Text(degree),
          ],
        ),
      ),
    );
  }
}
