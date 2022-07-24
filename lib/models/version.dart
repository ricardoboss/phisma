import 'dart:io';

class Version {
  static final RegExp _pathVersionRegex = RegExp(r'(?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)(?<flag>[^-]+)?-(?<safety>n?ts)-(?<os>[^-]+)-(?<compiler>[^-]+)-(?<arch>[^-]+)$');
  static final RegExp _cliVersionRegex = RegExp(r'^PHP (?<major>\d+)\.(?<minor>\d+)\.(?<patch>\d+)(?<flag>\S+)?\s\((?<interface>\w+)\)\s\(built: (?<date>.+)\s(?<time>.+)\)\s\(\s*(?<safety>(?:Z|N)?TS)?(?:\s(?<compiler>.+?))?(?:\s(?<arch>x\d+?)\s*)?(?:\s(?<debug>DEBUG))?(?:\s(?<gcov>GCOV))?\)$', multiLine: true, caseSensitive: false);

  int? major;
  int? minor;
  int? patch;
  String? flag;
  bool? threadSafe;
  String? arch;
  String? compiler;
  DateTime? buildTimestamp;

  Version({
    this.major,
    this.minor,
    this.patch,
    this.flag,
    this.threadSafe,
    this.arch,
    this.compiler,
    this.buildTimestamp,
  });

  factory Version.fromPath(String path) {
    final match = _pathVersionRegex.firstMatch(path);
    if (match == null) {
      throw ArgumentError('Cant match version to path: $path', path);
    }

    return Version(
      major: _tryParseIntFromPath(match, 'major'),
      minor: _tryParseIntFromPath(match, 'minor'),
      patch: _tryParseIntFromPath(match, 'patch'),
      flag: match.namedGroup('flag'),
      threadSafe: match.namedGroup('safety') == 'ts',
      arch: match.namedGroup('arch'),
      compiler: match.namedGroup('compiler'),
    );
  }

  factory Version.fromExecutable(String path) {
    final result = Process.runSync(path, ['--version']);
    if (result.exitCode != 0) {
      throw ArgumentError('Cant get version from executable: $path', path);
    }

    return Version.fromVersionOutput(result.stdout as String);
  }

  factory Version.fromVersionOutput(String output) {
    final match = _cliVersionRegex.firstMatch(output);
    if (match == null) {
      throw ArgumentError('Cant match version to output: $output', output);
    }

    return Version(
      major: _tryParseIntFromPath(match, 'major'),
      minor: _tryParseIntFromPath(match, 'minor'),
      patch: _tryParseIntFromPath(match, 'patch'),
      flag: match.namedGroup('flag'),
      threadSafe: match.namedGroup('safety') != 'NTS',
      arch: match.namedGroup('arch'),
      compiler: match.namedGroup('compiler'),
      //buildTimestamp: DateTime.parse('${match.namedGroup('date')} ${match.namedGroup('time')}'),
    );
  }

  static int? _tryParseIntFromPath(RegExpMatch match, String group) {
    final str = match.namedGroup(group);

    return str != null ? int.tryParse(str) : null;
  }

  String get name => '$major.$minor.$patch${flag ?? ''}';

  @override
  String toString() {
    return 'Version{major: $major, minor: $minor, patch: $patch, flag: $flag, threadSafe: $threadSafe, arch: $arch, compiler: $compiler}';
  }
}
