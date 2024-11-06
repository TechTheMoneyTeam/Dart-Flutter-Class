import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child: SizedBox(
            width: 800,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NewWidget(),
                SizedBox(height: 10),
                NewWidget(),
                SizedBox(height: 10),
                NewWidget(),
                SizedBox(height: 10),
                NewWidget(),
              ],
            ),
          ),
        ),
      ),
    ));

class NewWidget extends StatefulWidget {
  const NewWidget({
    super.key,
  });

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> {
   bool isSelected = false;
String getButtonText() {
  if (isSelected) {
    return "Selected";
  } else {
    return "Not Selected";
  }
}

  Color getButtonColor() {
      if (isSelected) {
    return Colors.blue.shade500;
  } else {
    return Colors.blue.shade50;
  }
  }

  Color getTextColor(){
    if (isSelected) {
    return Colors.white;
  } else {
    return Colors.black;
  }

  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isSelected = !isSelected;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: getButtonColor(),
      ),
      child: Text(getButtonText(),
      style: TextStyle(color: getTextColor()),),
    );
  }
}
 