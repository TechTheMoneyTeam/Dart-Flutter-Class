import 'package:flutter/material.dart';
import 'package:fudamental_flutter/W7-S1%20-%20PRACTICE-%20Flutter%20Quiz%20Project%20Start/model/quiz.dart';
import 'package:fudamental_flutter/W7-S1 - PRACTICE- Flutter Quiz Project Start/quiz_app.dart';

class QuestionScreen extends StatelessWidget {
  const QuestionScreen(
      {super.key, required this.question, required this.onTap});
  final Question question;
  final void Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                question.title,
                style: const TextStyle(
                  fontSize: 28.0,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              ...question.possibleAnswers.map(
                (answer) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: ElevatedButton(
                    onPressed: () => onTap(answer),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: SizedBox(
                      width: 150,
                      child: Text(
                        answer,
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,

                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
