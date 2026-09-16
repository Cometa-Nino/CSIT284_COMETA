import 'package:flutter/material.dart';

enum FoodCategory { sweetLover, savoryFan, spicyExplorer, healthyChoice }

class CategoryInfo {
  final String title;
  final String description;
  final IconData icon;

  const CategoryInfo({
    required this.title,
    required this.description,
    required this.icon,
  });
}

const Map<FoodCategory, CategoryInfo> categoryInfoMap = {
  FoodCategory.sweetLover: CategoryInfo(
    title: 'Sweet Lover',
    description: 'You enjoy desserts and sugary treats.',
    icon: Icons.cake,
  ),
  FoodCategory.savoryFan: CategoryInfo(
    title: 'Savory Fan',
    description: 'You enjoy salty and flavorful foods.',
    icon: Icons.fastfood,
  ),
  FoodCategory.spicyExplorer: CategoryInfo(
    title: 'Spicy Explorer',
    description: 'You like foods with a kick.',
    icon: Icons.local_fire_department,
  ),
  FoodCategory.healthyChoice: CategoryInfo(
    title: 'Healthy Choice',
    description: 'You prefer lighter and healthier meals.',
    icon: Icons.eco,
  ),
};

class QuestionOption {
  final String text;
  final FoodCategory category;

  const QuestionOption(this.text, this.category);
}

class QuizQuestion {
  final String text;
  final List<QuestionOption> options;

  const QuizQuestion(this.text, this.options);
}

final List<QuizQuestion> quizQuestions = [
  const QuizQuestion('What flavor do you enjoy most?', [
    QuestionOption('Sweet', FoodCategory.sweetLover),
    QuestionOption('Salty', FoodCategory.savoryFan),
    QuestionOption('Spicy', FoodCategory.spicyExplorer),
    QuestionOption('Sour', FoodCategory.savoryFan),
  ]),
  const QuizQuestion('Which snack would you choose?', [
    QuestionOption('Cake', FoodCategory.sweetLover),
    QuestionOption('Fries', FoodCategory.savoryFan),
    QuestionOption('Nachos', FoodCategory.savoryFan),
    QuestionOption('Fruit', FoodCategory.healthyChoice),
  ]),
  const QuizQuestion('What would you most likely order at a restaurant?', [
    QuestionOption('Dessert', FoodCategory.sweetLover),
    QuestionOption('Burger', FoodCategory.savoryFan),
    QuestionOption('Chicken Wings', FoodCategory.spicyExplorer),
    QuestionOption('Salad', FoodCategory.healthyChoice),
  ]),
];