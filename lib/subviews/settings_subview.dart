import 'package:flutter/material.dart';
import 'package:phisma/widgets/theme_selector.dart';

class SettingsSubview extends StatelessWidget {
  const SettingsSubview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).dividerColor),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Settings",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ],
              ),
              Wrap(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Theme",
                        style: Theme.of(context).textTheme.subtitle1,
                      ),
                      const ThemeSelector(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}