import 'package:flutter/material.dart';
import 'package:phisma/models/version_mapping.dart';

class EditVersionDialog extends StatelessWidget {
  final VersionMapping version;

  const EditVersionDialog({Key? key, required this.version}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      title: Text("Edit version"),
      children: [],
    );
  }
}
