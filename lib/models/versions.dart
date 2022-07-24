import 'package:flutter/material.dart';
import 'package:phisma/models/version_mapping.dart';

class VersionMappings with ChangeNotifier {
  final Set<VersionMapping> _versions = {};

  Iterable<VersionMapping> get versions => _versions;

  void addVersion(VersionMapping version) {
    _versions.add(version);

    notifyListeners();
  }

  void removeVersion(VersionMapping version) {
    _versions.remove(version);

    notifyListeners();
  }

  void clearVersions() {
    _versions.clear();

    notifyListeners();
  }
}