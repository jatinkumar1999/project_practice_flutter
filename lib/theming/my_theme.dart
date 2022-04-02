import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData light = ThemeData(
    backgroundColor: Colors.white,
    accentColor: Colors.red.shade400,
    cardColor: Colors.black,
  );
  static ThemeData dark = ThemeData(
    backgroundColor: Colors.black,
    accentColor: Colors.white54,
    cardColor: Colors.white,
  );
}
