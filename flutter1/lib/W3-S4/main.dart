import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Center(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Expanded(
          child: Container(
            height: 100,
            color: Colors.grey,
          ),
        ),
        Expanded(
          flex: 4,
          child: Container(
            
            height: 400,
            width: 100,
            color: Colors.blue,
          ),
        ),
        Expanded(
          child: Container(
            height: 100,

            color: Colors.green,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  
                  color: Colors.pink,
                  width: 100,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(width: 100, color: Colors.yellow),
                const SizedBox(
                  width: 20,
                ),
                Container(width: 100, color: Colors.yellow),
                const SizedBox(
                  width: 20,
                ),
                Container(width: 100, color: Colors.yellow),
              ],
            ),
          ),
        ),
    
   
       Container(
                        child: const SizedBox(
                  height: 20,
                ),
      ),
    

          
   
        Expanded(
          child: Container(
            child: Column(),
            color: Colors.pink,
          ),
        ),
      ])),
    ),
  );
}
