import 'package:flutter/material.dart';

import 'text_field_theme.dart';

final ThemeData themeDate = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.white,
    primary: const Color(0xFFFF0066),
    surface: const Color(0xFFF8F8F8),
  ),
  fontFamily: 'Inter',
  filledButtonTheme: FilledButtonThemeData(
    style: ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      ),
    ),
  ),
  inputDecorationTheme: textFieldTheme,
);
