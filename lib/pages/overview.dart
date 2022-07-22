import 'package:flutter/material.dart';
import 'package:phisma/subviews/settings_subview.dart';
import 'package:phisma/subviews/versions_subview.dart';
import 'package:phisma/widgets/stylized_title.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const padding = 8.0;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            StylizedTitle(),
            SizedBox(height: padding),
            Expanded(
              child: VersionsSubview(),
            ),
            SizedBox(height: padding),
            SizedBox(
              height: 200,
              child: SettingsSubview(),
            ),
          ],
        ),
      ),
    );
  }
}
