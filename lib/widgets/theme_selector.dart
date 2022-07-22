import 'package:flutter/material.dart';
import 'package:phisma/settings.dart';
import 'package:provider/provider.dart';

class ThemeSelector extends StatelessWidget {
  const ThemeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Settings>(
      builder: (BuildContext context, settings, _) => Column(
        children: [
          Row(
            children: [
              Radio<ThemeMode>(
                value: ThemeMode.system,
                groupValue: settings.themeMode,
                onChanged: (value) {
                  settings.themeMode = value;
                },
              ),
              const Text('System'),
            ],
          ),
          Row(
            children: [
              Radio<ThemeMode>(
                value: ThemeMode.light,
                groupValue: settings.themeMode,
                onChanged: (value) {
                  settings.themeMode = value;
                },
              ),
              const Text('Light'),
            ],
          ),
          Row(
            children: [
              Radio<ThemeMode>(
                value: ThemeMode.dark,
                groupValue: settings.themeMode,
                onChanged: (value) {
                  settings.themeMode = value;
                },
              ),
              const Text('Dark'),
            ],
          ),
        ],
      ),
    );
  }
}