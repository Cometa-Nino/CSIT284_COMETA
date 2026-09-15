import 'package:flutter/material.dart';

import 'quiz_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to the Quiz App",
              style: Theme.of(context).textTheme.headlineMedium!
                  .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Test your knowledge with flutter quizzes!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Press the button below to start the quiz.",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 15),
            TextButton(
              onPressed: () {
                // Navigate to the quiz page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const QuizScreen()),
                );
              },
              style: TextButton.styleFrom(
                side: const BorderSide(color: Colors.white, width: 30),
              ),

              child: const Text(
                "Start Quiz",
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
            ),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
