import 'package:flutter/material.dart';
import 'package:phisma/pages/startup.dart';
import 'package:phisma/settings.dart';
import 'package:provider/provider.dart';

class PhismaApp extends StatelessWidget {
  const PhismaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
      builder: (_, settings, home) => MaterialApp(
        title: 'Phisma',
        theme: ThemeData.light().copyWith(
          colorScheme: const ColorScheme.light(
            primary: Colors.orange,
            secondary: Colors.lightBlue,
          ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          colorScheme: const ColorScheme.dark(
            primary: Colors.amber,
            secondary: Colors.lightBlueAccent,
          ),
        ),
        themeMode: settings.themeMode ?? ThemeMode.system,
        home: home,
      ),
      child: const StartupPage(),
    );
  }
}
