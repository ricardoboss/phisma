import 'package:flutter/material.dart';
import 'package:phisma/models/version.dart';

class VersionsList extends StatelessWidget {
  final Iterable<Version> versions;

  const VersionsList({Key? key, required this.versions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final version in versions)
          Text(version.name),
      ],
    );
  }
}
