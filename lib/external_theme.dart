import 'package:flutter/material.dart';

class ExternalTheme {
  // Core color palette
  static const Color darkBackground = Color(0xFF1A1A18);
  static const Color surfaceColor = Color(0xFF262624);
  static const Color primaryCyan = Color(0xFF00E5FF);
  static const Color textSecondary = Color(0xFFB0BEC5);
  static const Color cardColor = Color(0xFF2A2A28);

  static ThemeData futuristicTheme = ThemeData.dark().copyWith(
    // Color scheme
    colorScheme: const ColorScheme.dark(
      primary: primaryCyan,
      surface: surfaceColor,
      background: darkBackground,
      onPrimary: Colors.black,
      onSurface: primaryCyan,
      onBackground: primaryCyan,
    ),

    scaffoldBackgroundColor: darkBackground,

    // AppBar theme - used in Expenses screen
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: primaryCyan,
        fontSize: 24,
        fontWeight: FontWeight.w300,
        letterSpacing: 2.0,
      ),
      iconTheme: IconThemeData(color: primaryCyan),
    ),

    // Card theme - used in ExpenseItem
    cardTheme: CardThemeData(
      color: cardColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: primaryCyan.withOpacity(0.2), width: 1),
      ),
    ),

    // Text theme - used throughout the app
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w300,
        color: primaryCyan,
        letterSpacing: 1.0,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        color: primaryCyan,
        letterSpacing: 0.5,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w300,
        color: primaryCyan,
        letterSpacing: 0.25,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: primaryCyan,
        letterSpacing: 0.5,
      ),
    ),

    // Input decoration theme - used in NewExpense form
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceColor,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryCyan.withOpacity(0.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: primaryCyan.withOpacity(0.3)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: const BorderSide(color: primaryCyan, width: 2),
      ),
      labelStyle: const TextStyle(
        color: textSecondary,
        fontWeight: FontWeight.w300,
      ),
    ),

    // Button theme - used in NewExpense and throughout
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryCyan,
        foregroundColor: Colors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        textStyle: const TextStyle(
          fontWeight: FontWeight.w300,
          letterSpacing: 1.0,
        ),
      ),
    ),
  );
}