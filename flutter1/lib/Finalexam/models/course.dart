// TODO
import 'studentscrore.dart';
class Course {
  final String name;
  final List<StudentScore> scores;
  
  Course(this.name, this.scores);
  
  double get average {
    if (scores.isEmpty) return 0;
    return scores.map((scoree) => scoree.score).reduce((a, b) => a + b) / scores.length;
  }
}

