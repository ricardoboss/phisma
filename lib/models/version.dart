import 'package:flutter/material.dart';

class Version with ChangeNotifier {
  static final RegExp _versionRegex = RegExp(r'(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)(?<flag>[^-]+)?-(?<safety>n?ts)-(?<os>[^-]+)-(?<compiler>[^-]+)-(?<arch>[^-]+)$');

  String _path;
  RegExpMatch? _match;

  int? _major;
  int? _minor;
  int? _patch;
  String? _flag;
  bool? _threadSafe;
  String? _arch;
  String? _compiler;

  Version(this._path);

  String get path => _path;

  set path(String value) {
    _path = value;
    _match = null;
    _major = null;
    _minor = null;
    _patch = null;
    _flag = null;
    _threadSafe = null;
    _arch = null;
    _compiler = null;

    notifyListeners();
  }

  get major => _major ??= _tryParseIntFromPath('major');
  get minor => _minor ??= _tryParseIntFromPath('minor');
  get patch => _patch ??= _tryParseIntFromPath('patch');
  get flag => _flag ??= _tryGetFromPath('flag');
  get threadSafe => _threadSafe ??= _tryGetFromPath('safety') == 'ts';
  get arch => _arch ??= _tryGetFromPath('arch');
  get compiler => _compiler ??= _tryGetFromPath('compiler');

  String? _tryGetFromPath(String group) {
    _match ??= _versionRegex.firstMatch(_path);

    return _match?.namedGroup(group);
  }

  int? _tryParseIntFromPath(String group) {
    final str = _tryGetFromPath(group);

    return str != null ? int.tryParse(str) : null;
  }

  @override
  String toString() {
    return 'Version{path: $path, major: $major, minor: $minor, patch: $patch, flag: $flag, threadSafe: $threadSafe, arch: $arch, compiler: $compiler}';
  }
}
