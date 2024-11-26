import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ronan the best Expense app'),
          backgroundColor: Colors.blue,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20),
        ),
        body:  Container(
          color: Colors.lightBlue.shade200,
        child: const Column(
           
        
          children: [
            
            NewWidget(
             
              text: "Flutter Course",
            ),
            NewWidget(
              text: "Cinema",
            )
          ],
        ),),
      ),
    ),
  );
}

class NewWidget extends StatelessWidget {
  final String text;

  const NewWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        
     
        children: [
          Text(

            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
