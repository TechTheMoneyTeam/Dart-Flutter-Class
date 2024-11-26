import 'package:flutter/material.dart';
import 'quiz_app.dart';
import 'model/quiz.dart';

void main() {
  Question q1 = const Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["ronan", "hongly", 'leangsiv'],
      goodAnswer: 'ronan');

  Question q2 = const Question(
      title: "Which color is the best?",
      possibleAnswers: ["blue", "red", 'green'],
      goodAnswer: 'red');
  // Question q3 = const Question(
  //   title: "What is Flutter?",
  //   possibleAnswers: ["A bird", "A UI toolkit", "A programming language"],
  //   goodAnswer: "A UI toolkit",
  // );

  // Question q4 = const Question(
  //   title: "Who developed Dart?",
  //   possibleAnswers: ["Google", "Microsoft", "Facebook"],
  //   goodAnswer: "Google",
  // );

  // Question q5 = const Question(
  //   title: "What does HTTP stand for?",
  //   possibleAnswers: [
  //     "Hyper Text Transfer Protocol",
  //     "Hyper Transfer Text Protocol",
  //     "High Text Transmission Protocol"
  //   ],
  //   goodAnswer: "Hyper Text Transfer Protocol",
  // );

  // Question q6 = const Question(
  //   title: "What is the capital of Cambodia?",
  //   possibleAnswers: ["Phnom Penh", "Siem Reap", "Battambang"],
  //   goodAnswer: "Phnom Penh",
  // );

  // Question q7 = const Question(
  //   title: "Which one is a fruit?",
  //   possibleAnswers: ["Carrot", "Apple", "Cucumber"],
  //   goodAnswer: "Apple",
  // );

  // Question q8 = const Question(
  //   title: "Which planet is closest to the sun?",
  //   possibleAnswers: ["Mars", "Earth", "Mercury"],
  //   goodAnswer: "Mercury",
  // );

  // Question q9 = const Question(
  //   title: "What is the largest mammal?",
  //   possibleAnswers: ["Elephant", "Blue Whale", "Giraffe"],
  //   goodAnswer: "Blue Whale",
  // );

  // Question q10 = const Question(
  //   title: "What is the sum of 1 + 1?",
  //   possibleAnswers: ["10", "2", "11"],
  //   goodAnswer: "10",
  // );

  // Question q11 = const Question(
  //   title: "What color is the sky on a clear day?",
  //   possibleAnswers: ["Green", "Blue", "Yellow"],
  //   goodAnswer: "Blue",
  // );

  List<Question> myQuestions = [q1, q2];
  Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);
runApp(QuizApp( myQuiz,));}
