import 'package:flutter/material.dart';

import 'package:expense_tracker/models/expense.dart';

class TotalExpensesCard extends StatelessWidget {
  const TotalExpensesCard({super.key, required this.expenses});

  final List<Expense> expenses;

  double get _total =>
      expenses.fold(0.0, (sum, expense) => sum + expense.amount);

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total spent', style: titleStyle),
            Text('\$${_total.toStringAsFixed(2)}', style: titleStyle),
          ],
        ),
      ),
    );
  }
}