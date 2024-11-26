import 'package:flutter/material.dart';
import 'package:fudamental_flutter/W7-S1%20-%20PRACTICE-%20Flutter%20Quiz%20Project%20Start/widgets/app_button.dart';

class WelcomeScreen extends StatelessWidget {
  final VoidCallback onStart;
  const WelcomeScreen({
    super.key,
    required this.onStart,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/W7-S2/quiz-logo.png',width: 300.0,),
          
          const SizedBox(height: 80),
          const Text(
            'Crazy Quiz',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          AppButton(
            'Start Quiz',
            icon: Icons.arrow_right_alt,
            onTap: onStart,
          ),
        ],
      ),
    );
  }
}
