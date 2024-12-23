// TODO
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter1/Finalexam/models/studentscrore.dart';

class ScoreForm extends StatefulWidget {
  final String courseName;
  const ScoreForm({super.key, required this.courseName});
  @override
  State<ScoreForm> createState() => _ScoreFormState();
}

class _ScoreFormState extends State<ScoreForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _scoreController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _scoreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Add Score'),
        
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  
                
                ),
                 maxLength: 50,
                validator: (value) {
                    final name = value;
                  if ( name!.length > 50 || name.isEmpty ) {
                    return 'Must be between 1 and 50 characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
                controller: _scoreController,
                decoration: const InputDecoration(
                  labelText: 'Score',
         
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  final score = double.tryParse(value!);
                  if (score == null || score < 0 || score > 100) {
                    return 'Must be a Score between 0 and 100';
                  }
                  return null;
                },
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final score = StudentScore(
                      _nameController.text,
                      double.parse(_scoreController.text),
                    );
                    Navigator.pop(context, score);
                  }
                },
                child: const Text('Add Score'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
