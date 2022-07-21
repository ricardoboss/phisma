import 'package:flutter/material.dart';

class Settings with ChangeNotifier {
  ThemeMode? _themeMode;

  ThemeMode? get themeMode => _themeMode;

  set themeMode(ThemeMode? value) {
    _themeMode = value;

    notifyListeners();
  }
}