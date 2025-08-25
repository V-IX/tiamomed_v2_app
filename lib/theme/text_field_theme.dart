import 'package:flutter/material.dart';

final InputDecorationTheme textFieldTheme = InputDecorationTheme(
  prefixIconColor: Colors.grey,
  filled: true,
  fillColor: Colors.white,
  alignLabelWithHint: true,
  labelStyle: const TextStyle(
    color: Color(0xFF8C8E94),
    fontSize: 15,
    fontWeight: FontWeight.w300,
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(100.0),
    borderSide: const BorderSide(color: Colors.redAccent),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(100.0),
    borderSide: const BorderSide(color: Colors.redAccent),
  ),
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 22.0),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(100.0),
    borderSide:
    const BorderSide(color: Color(0xFFDDDFE1)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(100.0)
  ),
);
