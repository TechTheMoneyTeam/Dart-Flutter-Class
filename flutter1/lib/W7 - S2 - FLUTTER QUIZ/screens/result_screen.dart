import 'package:flutter/material.dart';
import 'package:fudamental_flutter/W7-S1%20-%20PRACTICE-%20Flutter%20Quiz%20Project%20Start/model/quiz.dart';
import 'package:fudamental_flutter/W7-S1%20-%20PRACTICE-%20Flutter%20Quiz%20Project%20Start/model/submission.dart';
import 'package:fudamental_flutter/W7-S1 - PRACTICE- Flutter Quiz Project Start/quiz_app.dart';
import 'package:fudamental_flutter/W7-S1 - PRACTICE- Flutter Quiz Project Start/widgets/app_button.dart';

class ResultScreen extends StatelessWidget {
  final VoidCallback onRestart;
  final Submission submission;
  final Quiz quiz;

  const ResultScreen({
    super.key,
    required this.onRestart,
    required this.submission,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Answer ${submission.getScore()} on ${quiz.questions.length}!',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 24.0, color: Colors.white),
            ),
            const SizedBox(height: 20.0),
            Expanded(
                child: ListView.builder(
              itemCount: quiz.questions.length,
              itemBuilder: (context, index) {
                final question = quiz.questions[index];
                final answer = submission.getAnswerFor(question);
                final userAnswer = answer.questionAnswer;
                final isCorrect = answer.isCorrect();
                return ResultItem(
                    questionIndex: index + 1,
                    question: question,
                    userAnswer: userAnswer,
                    isCorrect: isCorrect);
              },
            )),
            const SizedBox(height: 20.0),
            AppButton(
              'Reset Quiz',
              icon: Icons.restart_alt,
              onTap: onRestart,
            ),
          ],
        ),
      ),
    );
  }
}

class ResultItem extends StatelessWidget {
  const ResultItem({
    super.key,
    required this.questionIndex,
    required this.question,
    required this.userAnswer,
    required this.isCorrect,
  });

  final int questionIndex;
  final Question question;
  final String userAnswer;
  final bool isCorrect;

  Color get backgroundColor => isCorrect ? Colors.green : Colors.red;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 16,
            backgroundColor: backgroundColor,
            child: Text(
              questionIndex.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: question.possibleAnswers.map((answer) {
                    Color answerColor;
                    if (answer == question.goodAnswer) {
                      answerColor = Colors.green; 
                    } else if (answer == userAnswer && !isCorrect) {
                      answerColor = Colors.red; 
                    } else {
                      answerColor = Colors.black; 
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2.0),
                      child: Text(
                        answer,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: answerColor,
                          fontWeight: answerColor != Colors.black
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
