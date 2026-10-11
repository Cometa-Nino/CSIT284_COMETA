import 'package:flutter/material.dart';

class EmptyExpensesMessage extends StatelessWidget {
  const EmptyExpensesMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.receipt_long,
            size: 64,
            color: theme.colorScheme.onSurface.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 16),
          Text('No expenses found.', style: theme.textTheme.titleMedium),
          const SizedBox(height: 4),
          const Text('Tap + to add your first one.'),
        ],
      ),
    );
  }
}