import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Column(
      children: [
        NewWidget(label:"Hello 1",start:Colors.blue,end:Colors.red),
        NewWidget(label:"Hello 3",start:Colors.blue,end:Colors.red),
        NewWidget(label:"Hello 2",start:Colors.blue,end:Colors.red),
        

     
      ],
    ),
  ));
}

class NewWidget extends StatelessWidget {
  final String label;
  final Color start;
  final Color end;
  const NewWidget({
    super.key, required this.label, required this.start, required this.end,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        gradient:  LinearGradient(colors: [
          start,
          end
          
        ]),
        borderRadius: BorderRadius.circular(30)
      ),
     
      child: Text(label,
          style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              decoration: TextDecoration.none)),
    );
  }
}
