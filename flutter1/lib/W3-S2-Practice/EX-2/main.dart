import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.all(50),
      color: Colors.lightBlue,
      
      child: Center(
        
        child: Container(
          decoration: BoxDecoration(color: Colors.blue,
          borderRadius: BorderRadius.circular(10) ,

          ),
          child: const Center(
            child: Text("Cadt Student",
            style: TextStyle(color: Colors.white,
            decoration: TextDecoration.none,),
            
          ),
          ),

      ),
    ),
  )));
}
