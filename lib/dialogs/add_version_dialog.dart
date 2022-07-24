import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:phisma/models/version.dart';
import 'package:phisma/models/version_mapping.dart';

class AddVersionDialog extends StatefulWidget {
  const AddVersionDialog({Key? key}) : super(key: key);

  @override
  State<AddVersionDialog> createState() => _AddVersionDialogState();
}

class _AddVersionDialogState extends State<AddVersionDialog> {
  String? _path;
  late TextEditingController _controller;

  _AddVersionDialogState() {
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
      title: const Text("Add version"),
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
                _path = result;
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
          onPressed: _path == null
              ? null
              : () {
                  final version = Version.fromPath(_path!);
                  final mapping = VersionMapping(version: version, path: Directory(_path!));
                  Navigator.of(context).pop(mapping);
                },
          child: const Text("Add"),
        ),
      ],
    );
  }
}
