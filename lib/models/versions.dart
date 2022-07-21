import 'package:flutter/material.dart';
import 'package:phisma/models/version.dart';

class Versions with ChangeNotifier {
  final Set<Version> _versions = {};

  Iterable<Version> get versions => _versions;

  void addVersion(Version version) {
    _versions.add(version);

    notifyListeners();
  }

  void removeVersion(Version version) {
    _versions.remove(version);

    notifyListeners();
  }

  void clearVersions() {
    _versions.clear();

    notifyListeners();
  }
}