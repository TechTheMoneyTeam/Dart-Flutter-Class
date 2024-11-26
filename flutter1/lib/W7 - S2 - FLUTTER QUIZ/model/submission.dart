import 'quiz.dart';

class Answer {
  final Question question;
  final String questionAnswer;
  Answer(this.questionAnswer, this.question);

  bool isCorrect() {
    if (question.goodAnswer == questionAnswer) {
      return true;
    } else {
      return false;
    }
  }
}

class Submission {
  List<Answer> answers = [];
  int getScore() {
    int totalScore = 0;
    for (var answer in answers) {
      totalScore += answer.isCorrect() ? 1 : 0;
    }
    return totalScore;
  }

  Answer getAnswerFor(Question question) {
    for (var answer in answers) {
      if (answer.question == question) {
        return answer;
      }
    }
      throw Exception('No answer found for the provided question.');
  }

  void addAnswer(Question question, String answer) {
    answers.add(Answer(answer, question));
  }

  void removeAnswers() {
    answers.clear();
  }
}
