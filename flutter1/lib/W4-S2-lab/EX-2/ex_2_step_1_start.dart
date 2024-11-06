import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: FavoriteCards(),
    ));

class FavoriteCards extends StatefulWidget {
  @override
  FavoriteCardsState createState() => FavoriteCardsState();
}

class FavoriteCardsState extends State<FavoriteCards> {
  List<bool> isFavorite = [false, false, false];

  void toggleFavorite(int index) {
    setState(() {
      isFavorite[index] = !isFavorite[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: ListView(
        children: List.generate(3, (index) {
          return Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title ',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text('Description of card '),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () => toggleFavorite(index),
                      icon: Icon(
                        isFavorite[index]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
