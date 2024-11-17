import 'dart:io';

enum AnswerSheet { correct, incorrect, partiallyCorrect }

abstract class Question {
  String question;
  List<String> options;

  Question(this.question, this.options);

  void showQuestion() {
    print("Question: $question");
    for (int i = 0; i < options.length; i++) {
      print("${i + 1}. ${options[i]}");
    }
  }

  AnswerSheet checkAnswer(List<int> answer);
}

class Participant {
  String firstName;
  String lastName;

  Participant(this.firstName, this.lastName);

  @override
  String toString() {
    return "Participant Name: $firstName $lastName";
  }
}

class QuestionSingleChoice extends Question {
  int answerCorrect;

  QuestionSingleChoice(String question, this.answerCorrect, List<String> options)
      : super(question, options);

  @override
  AnswerSheet checkAnswer(List<int> answer){
    if (answer.length != 1) {
      print("Please provide only one answer for a single-choice question.");
      return AnswerSheet.incorrect;
    }
    if (answer[0] == answerCorrect) {
      return AnswerSheet.correct;
    } else {
      print("Correct answer is: ${options[answerCorrect - 1]}");
      return AnswerSheet.incorrect;
    }
  }
}

class QuestionMultipleChoice extends Question {
  List<int> answerCorrect;

  QuestionMultipleChoice(String question, this.answerCorrect, List<String> options)
      : super(question, options);

  @override
  AnswerSheet checkAnswer(List<int> answer)  {
    bool allCorrect = answer.every((ans) => answerCorrect.contains(ans));
    bool hasIncorrect = answer.any((ans) => !answerCorrect.contains(ans));

    if (allCorrect && !hasIncorrect) {
      return AnswerSheet.correct;
    } else if (allCorrect && hasIncorrect) {
      print(
          "Correct answers are: ${answerCorrect.map((index) => options[index - 1]).join(', ')}");
      return AnswerSheet.partiallyCorrect;
    } else {
      print(
          "Correct answers are: ${answerCorrect.map((index) => options[index - 1]).join(', ')}");
      return AnswerSheet.incorrect;
    }
  }
}

class Result {
  Participant participant;
  double score;
  int totalQuestions;
  List<AnswerSheet> answerDetails;

  Result(this.participant, this.score, this.totalQuestions, this.answerDetails);

  String answerDetailToString(AnswerSheet answer) {
    switch (answer) {
      case AnswerSheet.correct:
        return "Correct";
      case AnswerSheet.incorrect:
        return "Incorrect";
      case AnswerSheet.partiallyCorrect:
        return "Partially Correct";
    }
  }

  @override
  String toString() {
    return '$participant  Score: $score / $totalQuestions\n'
           'Answer Details: ${answerDetails.map(answerDetailToString).join(', ')}';
  }
}

class Quiz {
  List<Result> results = [];
  List<Question> questions = [];

  void addQuestion(Question question) {
    questions.add(question);
  }

  void takeQuiz(Participant participant) {
    double score = 0;
    List<AnswerSheet> answerDetails = [];

    for (var question in questions) {
      question.showQuestion();
      List<int> userAnswer = getUserAnswer(question);
      AnswerSheet result = question.checkAnswer(userAnswer);
      score = updateScore(score, result);
      answerDetails.add(result);
    }

    results.add(Result(participant, score, questions.length, answerDetails));
  }

  List<int> getUserAnswer(Question question) {
    print("Enter your answer if multiple use comma");
    List<String> input = stdin.readLineSync()?.split(',') ?? [];
    return input.map((str) => int.tryParse(str.trim()) ?? 0).toList();
  }

  double updateScore(double score, AnswerSheet result) {
    if (result == AnswerSheet.correct) {
      print("Your answer is correct.");
      return score + 1;
    } else if (result == AnswerSheet.partiallyCorrect) {
      print("Your answer is partially correct.");
      return score + 0.5;
    } else {
      print("Your answer is incorrect.");
    }
    return score;
  }

  void displayResults() {
    for (var result in results) {
      print(result);
    }
  }
}

void main() {
  print("Enter your first name:");
  String firstName = stdin.readLineSync() ?? "";
  print("Enter your last name:");
  String lastName = stdin.readLineSync() ?? "";
  
  Participant participant = Participant(firstName, lastName);
  Quiz quiz = Quiz();

  quiz.addQuestion(QuestionSingleChoice(
      "What is the name of the Fundamental of Mobile Developer teacher?",
      3,
      ["Ronan", "Nith", "Sal"]));

  quiz.addQuestion(QuestionMultipleChoice(
      "Who are students?", [2, 3, 4], ["Ronan", "Nith", "Tech", "Cheat"]));

  quiz.takeQuiz(participant);
  quiz.displayResults();
}
