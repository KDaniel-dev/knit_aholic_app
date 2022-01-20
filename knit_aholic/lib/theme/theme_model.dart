import 'package:flutter/material.dart';
import 'theme_preferences.dart';

class ThemeModel extends ChangeNotifier {
  int _theme = 0;
  late ThemePreferences _preferences;
  int get theme => _theme;

  ThemeModel() {
    _theme = 0;
    _preferences = ThemePreferences();
    getPreferences();
  }

  set setTheme(int value) {
    _theme = value;
    _preferences.setTheme(value);
    notifyListeners();
  }

  getPreferences() async {
    _theme = await _preferences.getTheme();
    notifyListeners();
  }
}
