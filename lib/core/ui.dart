import 'package:flutter/material.dart';

class AppColors {
  static Color primary = const Color(0xFFF13223);
  static Color light = Colors.deepPurple.shade50;
  static Color dark = const Color.fromARGB(255, 19, 18, 24);
}

class AppThemes {
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorSchemeSeed: AppColors.primary,
  );
}
