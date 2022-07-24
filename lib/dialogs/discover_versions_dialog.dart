import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:phisma/models/version.dart';
import 'package:phisma/models/version_mapping.dart';

class DiscoverVersionsDialog extends StatefulWidget {
  const DiscoverVersionsDialog({super.key});

  @override
  State<DiscoverVersionsDialog> createState() => _DiscoverVersionsDialogState();
}

class _DiscoverVersionsDialogState extends State<DiscoverVersionsDialog> {
  String? _parentPath;
  late TextEditingController _controller;

  _DiscoverVersionsDialogState() {
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Discover versions"),
      content: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: const InputDecoration(
                labelText: "Path",
              ),
              controller: _controller,
              readOnly: true,
            ),
          ),
          TextButton(
            onPressed: () async {
              final result = await FilePicker.platform.getDirectoryPath();
              if (result == null) {
                return;
              }

              setState(() {
                _parentPath = result;
                _controller.text = result;
              });
            },
            child: const Text("Browse"),
          ),
        ],
      ),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.of(context).pop(null),
        ),
        TextButton(
          onPressed: _parentPath == null
              ? null
              : () {
                  final d = Directory(_parentPath!);
                  final versions = d
                      .listSync(recursive: true)
                      .whereType<Directory>()
                      .map((d) {
                        try {
                          final bin = "${d.path}/php.exe";
                          if (File(bin).existsSync()) {
                            final version = Version.fromExecutable(bin);
                            return VersionMapping(version: version, path: d);
                          }
                        } catch (e) {
                          return null;
                        }
                      })
                      .where((v) => v != null)
                      .cast<VersionMapping>()
                      .toList();

                  Navigator.of(context).pop(versions);
                },
          child: const Text("Discover"),
        ),
      ],
    );
  }
}
