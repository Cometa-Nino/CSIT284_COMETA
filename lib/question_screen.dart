import 'package:flutter/material.dart';
import 'food_category.dart';
import 'result_screen.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int currentQuestionIndex = 0;
  int? selectedOptionIndex;
  final Map<FoodCategory, int> tally = {
    FoodCategory.sweetLover: 0,
    FoodCategory.savoryFan: 0,
    FoodCategory.spicyExplorer: 0,
    FoodCategory.healthyChoice: 0,
  };

  void _selectOption(int index) {
    setState(() {
      selectedOptionIndex = index;
    });
  }

  void _goToNext() {
    if (selectedOptionIndex == null) return;

    final chosenCategory =
        quizQuestions[currentQuestionIndex].options[selectedOptionIndex!].category;
    tally[chosenCategory] = (tally[chosenCategory] ?? 0) + 1;

    if (currentQuestionIndex < quizQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOptionIndex = null;
      });
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen(tally: tally)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final question = quizQuestions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${currentQuestionIndex + 1} of ${quizQuestions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question.text,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  final option = question.options[index];
                  final isSelected = selectedOptionIndex == index;
                  return Card(
                    color: isSelected ? Colors.deepOrange.shade100 : null,
                    child: ListTile(
                      title: Text(option.text),
                      trailing: isSelected
                          ? const Icon(Icons.check_circle, color: Colors.deepOrange)
                          : null,
                      onTap: () => _selectOption(index),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: selectedOptionIndex == null ? null : _goToNext,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text(
                currentQuestionIndex < quizQuestions.length - 1 ? 'Next' : 'See Result',
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}