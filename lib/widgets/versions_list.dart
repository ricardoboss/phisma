import 'package:flutter/material.dart';
import 'package:phisma/models/version.dart';
import 'package:provider/provider.dart';

class VersionsList extends StatelessWidget {
  final Iterable<Version> versions;

  const VersionsList({Key? key, required this.versions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (final version in versions)
          ChangeNotifierProvider.value(
            value: version,
            builder: (ctx, _) => Text(ctx.watch<Version>().toString()),
          ),
      ],
    );
  }
}
