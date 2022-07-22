import 'package:flutter/material.dart';
import 'package:phisma/app.dart';
import 'package:phisma/models/versions.dart';
import 'package:phisma/settings.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  final settings = Settings();
  final versions = Versions();

  SharedPreferences.getInstance().then((prefs) {
    if (prefs.containsKey('theme')) {
      final themeValue = prefs.getString('theme');
      switch (themeValue) {
        case 'dark':
          settings.themeMode = ThemeMode.dark;
          break;
        case 'light':
          settings.themeMode = ThemeMode.light;
          break;
        default:
          settings.themeMode = ThemeMode.system;
          break;
      }
    }

    settings.addListener(() {
      final theme = settings.themeMode;
      if (theme != null) {
        prefs.setString('theme', theme.name);
      }
    });
  });

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: settings),
      ChangeNotifierProvider.value(value: versions),
    ],
    child: const PhismaApp(),
  ));
}
