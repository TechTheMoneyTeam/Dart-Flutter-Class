import 'package:flutter/material.dart';

enum Product { dart, flutter, firebase }

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text("product"),
          backgroundColor: Colors.white,
        ),
        body: const Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              NewWidget(
                title: "Dart",
                desc: "The best object language",
                im: AssetImage('assets/W2-S2/dart.png'),
                product: [Product.dart],
              ),
              NewWidget(
                title: "Flutter",
                desc: "The best mobile widet library",
                im: AssetImage('assets/W2-S2/flutter.png'),
                product: [Product.flutter],
              ),
              NewWidget(
                title: "Firebase",
                desc: "The best cloud database",
                im: AssetImage('assets/W2-S2/firebase.png'),
                product: [Product.firebase],
              ),
            ],
          ),
        )),
  ));
}

class NewWidget extends StatelessWidget {
  final String title;
  final String desc;
  final List<Product> product;
  final ImageProvider im;
  const NewWidget({
    super.key,
    required this.product,
    required this.title,
    required this.desc,
    required this.im,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
      width: 1000,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: const EdgeInsets.all(5.36),
              child: Image(
                image: im,
                width: 100,
                height: 100,
              )),
          Container(
              margin: const EdgeInsets.all(5.36),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              )),
          Container(
              margin: const EdgeInsets.all(5.36),
              child: Text(desc,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))),
        ],
      ),
    ));
  }
}
