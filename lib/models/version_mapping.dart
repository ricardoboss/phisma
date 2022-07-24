import 'dart:io';

import 'package:phisma/models/version.dart';

class VersionMapping {
  final Version version;
  final Directory path;

  VersionMapping({
    required this.version,
    required this.path,
  });
}
