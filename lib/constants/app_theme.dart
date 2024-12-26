import 'package:flutter/material.dart';

class AppTheme {
  // Dark Theme
  static ThemeData get darkTheme {
    return ThemeData(
      scaffoldBackgroundColor: const Color(0xFF292929),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color(0xFF202359),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(color: Color(0xFFFFFFFF), fontSize: 32),  // Büyük başlık
        titleMedium: TextStyle(color: Color(0xFFFFFFFF), fontSize: 28), // Orta başlık
        bodyMedium: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),  // Gövde metni
        bodySmall: TextStyle(color: Color(0xFFFFFFFF), fontSize: 14),   // Küçük metin
      ),
    );
  }
}
