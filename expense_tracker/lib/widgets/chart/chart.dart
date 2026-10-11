import 'dart:math' as math;

import 'package:flutter/material.dart';

import 'package:expense_tracker/models/category.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/expense_bucket.dart';
import 'package:expense_tracker/widgets/chart/chart_bar.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses, this.height = 180});

  final List<Expense> expenses;
  final double height;

  List<ExpenseBucket> get buckets => Category.values
      .map((category) => ExpenseBucket.forCategory(expenses, category))
      .toList();

  double _maxTotal(List<ExpenseBucket> buckets) => buckets.fold(
        0.0,
        (maxSoFar, bucket) => math.max(maxSoFar, bucket.totalExpenses),
      );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;
    final currentBuckets = buckets;
    final maxTotal = _maxTotal(currentBuckets);

    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            theme.colorScheme.primary.withValues(alpha: 0.3),
            theme.colorScheme.primary.withValues(alpha: 0.0),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (final bucket in currentBuckets)
                  ChartBar(
                    fill: maxTotal == 0 ? 0 : bucket.totalExpenses / maxTotal,
                  ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              for (final bucket in currentBuckets)
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Icon(
                      bucket.category.icon,
                      color: isDarkMode
                          ? theme.colorScheme.secondary
                          : theme.colorScheme.primary.withValues(alpha: 0.7),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}