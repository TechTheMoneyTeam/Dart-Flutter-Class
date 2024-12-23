// TODO
import 'package:flutter/material.dart';
import 'package:flutter1/Finalexam/models/course.dart';
import 'score_form.dart';
import 'package:flutter1/Finalexam/models/studentscrore.dart';

class CourseView extends StatefulWidget {
  final Course course;
  final Function(StudentScore) onScoreAdded;

  const CourseView({
    super.key,
    required this.course,
    required this.onScoreAdded,
  });

  @override
  State<CourseView> createState() => _CourseViewState();
}

class _CourseViewState extends State<CourseView> {
  late List<StudentScore> scores;

  @override
  void initState() {
    super.initState();
    scores = List.from(widget.course.scores);
  }

  Color _getColor(double score) {
    if (score > 50) return Colors.green;
    if (score >= 30) return Colors.orange;
    return Colors.red;
  }

  void _addScore() async {
    final score = await Navigator.push<StudentScore>(
      context,
      MaterialPageRoute(
        builder: (context) => ScoreForm(courseName: widget.course.name),
      ),
    );

    if (score != null) {
      setState(() {
        scores.add(score);
      });
      widget.onScoreAdded(score);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.pink,
        leading: IconButton(
         
          icon: const Icon(Icons.arrow_back),

          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.course.name),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addScore,
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: scores.length,
        itemBuilder: (context, index) {
          final score = scores[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(score.studentName),
              trailing: Text(
                score.score.toStringAsFixed(0),
                style: TextStyle(
                  color: _getColor(score.score),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
