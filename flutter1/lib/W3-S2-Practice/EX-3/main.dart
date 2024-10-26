import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(

      margin: const EdgeInsets.all(30),
      padding: const EdgeInsets.all(20),
      
      child: Column(
        
        children: [
        Container(
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue[100],
          ),
          child: const Center(
            child: Text("OOP",
            style: TextStyle(color: Colors.white,decoration: TextDecoration.none),  
            ),
          ),
        ),
        
        Container(
        margin: const EdgeInsets.all(30),
    

        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue[300],
          ),
          child: const Center(
            child: Text("DART",
            style: TextStyle(color: Colors.white,decoration: TextDecoration.none),  
            ),
          ),
        ),
        Container(
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(colors: [
          Colors.blue.shade300
          ,Colors.blue.shade900]
          ),
          ),
          child: const Center(
            child: Text("FLUTTER",
            style: TextStyle(color: Colors.white,decoration: TextDecoration.none),  
            ),
          ),
        ),
        ]
      ),
    ),
      
     
     ),
  );
}
