import 'package:flutter/material.dart';
import 'food_category.dart';

class ResultScreen extends StatelessWidget {
  final Map<FoodCategory, int> tally;

  const ResultScreen({super.key, required this.tally});

  FoodCategory _getTopCategory() {
    FoodCategory topCategory = tally.keys.first;
    int highestCount = -1;

    for (final entry in tally.entries) {
      if (entry.value > highestCount) {
        highestCount = entry.value;
        topCategory = entry.key;
      }
    }
    return topCategory;
  }

  @override
  Widget build(BuildContext context) {
    final topCategory = _getTopCategory();
    final info = categoryInfoMap[topCategory]!;

    return Scaffold(
      appBar: AppBar(title: const Text('Your Result')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Recommended Category:',
                style: TextStyle(fontSize: 18, color: Colors.black54),
              ),
              const SizedBox(height: 12),
              Icon(info.icon, size: 100, color: Colors.deepOrange),
              const SizedBox(height: 12),
              Text(
                info.title,
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                info.description,
                style: const TextStyle(fontSize: 16, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                ),
                child: const Text('Try Again', style: TextStyle(fontSize: 18)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}