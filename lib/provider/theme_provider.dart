import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode thememode = ThemeMode.dark;

  bool get isDarkMode => thememode == ThemeMode.dark;

  changeThemeMode(bool mode) {
    thememode = mode ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
