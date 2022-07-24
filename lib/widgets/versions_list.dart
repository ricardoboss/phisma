import 'package:flutter/material.dart';
import 'package:phisma/dialogs/edit_version_dialog.dart';
import 'package:phisma/models/version_mapping.dart';

class VersionsList extends StatelessWidget {
  final Iterable<VersionMapping> versions;

  const VersionsList({Key? key, required this.versions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final version in versions)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 1.0,
                ),
              ),
            ),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () async {
                  await showDialog(
                    context: context,
                    builder: (ctx) => EditVersionDialog(version: version),
                  );
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      version.version.name,
                      style: const TextStyle(
                        fontSize: 21,
                      ),
                    ),
                    Text(
                      version.path.path,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}
