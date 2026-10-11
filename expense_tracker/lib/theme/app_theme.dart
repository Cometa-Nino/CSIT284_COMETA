import 'package:flutter/material.dart';

final _lightScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

final _darkScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

const _cardMargin = EdgeInsets.symmetric(horizontal: 16, vertical: 8);

abstract final class AppTheme {
  static ThemeData get light => ThemeData().copyWith(
        colorScheme: _lightScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: _lightScheme.onPrimaryContainer,
          foregroundColor: _lightScheme.primaryContainer,
        ),
        cardTheme: const CardThemeData().copyWith(
          color: _lightScheme.secondaryContainer,
          margin: _cardMargin,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _lightScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: _lightScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      );

  static ThemeData get dark => ThemeData.dark().copyWith(
        colorScheme: _darkScheme,
        cardTheme: const CardThemeData().copyWith(
          color: _darkScheme.secondaryContainer,
          margin: _cardMargin,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _darkScheme.primaryContainer,
            foregroundColor: _darkScheme.onPrimaryContainer,
          ),
        ),
      );
}