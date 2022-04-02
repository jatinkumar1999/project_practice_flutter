import 'package:flutter/material.dart';
import 'package:practice_project_flutter/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class ThemeSwitchToggleButton extends StatelessWidget {
  const ThemeSwitchToggleButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var themeMode = Provider.of<ThemeProvider>(context);
    return Switch(
        activeTrackColor: Colors.white,
        activeColor: Colors.grey.shade400,
        inactiveThumbColor: Colors.blue,
        inactiveTrackColor: Colors.grey,
        value: themeMode.isDarkMode,
        onChanged: (value) {
          themeMode.changeThemeMode(value);
        });
  }
}
