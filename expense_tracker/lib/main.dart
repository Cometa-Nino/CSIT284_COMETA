import 'package:flutter/material.dart';

import 'package:expense_tracker/theme/app_theme.dart';
import 'package:expense_tracker/widgets/expenses.dart';

void main() {
  runApp(
    MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}