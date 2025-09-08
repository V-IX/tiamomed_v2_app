import 'package:flutter/material.dart';

const InputDecorationTheme textFieldTheme = InputDecorationTheme(
  prefixIconColor: Colors.grey,
  filled: true,
  fillColor: Colors.white,
  alignLabelWithHint: true,
  hintStyle: TextStyle(color: Color(0xFF8C8E94), fontSize: 16, fontWeight: FontWeight.w300),
  labelStyle: const TextStyle(color: Color(0xFF8C8E94), fontSize: 16, fontWeight: FontWeight.w300),
  errorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.redAccent)),
  focusedErrorBorder: OutlineInputBorder(borderSide: const BorderSide(color: Colors.redAccent)),
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 22.0),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.zero,
    borderSide: const BorderSide(color: Color(0xFFDDDFE1)),
  ),
  focusedBorder: OutlineInputBorder(),
);

OutlineInputBorder textFieldBorder = const OutlineInputBorder(
  borderRadius: BorderRadius.zero,
  borderSide: BorderSide.none,
);

final InputDecoration largeTextFieldDecoration = InputDecoration(
  hintText: 'Оставьте свой отзыв...',
  hintStyle: const TextStyle(color: Color(0xFF8C8E94), fontSize: 16, fontWeight: FontWeight.w300),
  prefixIconColor: Colors.grey,
  filled: true,
  fillColor: Colors.white,
  border: InputBorder.none,
  labelStyle: const TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w300),
  contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 22.0),
  errorBorder: textFieldBorder,
  focusedErrorBorder: textFieldBorder,
  enabledBorder: textFieldBorder,
  focusedBorder: textFieldBorder,
);
