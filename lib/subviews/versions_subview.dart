import 'package:flutter/material.dart';
import 'package:phisma/dialogs/add_version_dialog.dart';
import 'package:phisma/dialogs/discover_versions_dialog.dart';
import 'package:phisma/models/version.dart';
import 'package:phisma/models/versions.dart';
import 'package:phisma/widgets/versions_list.dart';
import 'package:provider/provider.dart';

const double _kToolbarHeight = 28.0;

class VersionsSubview extends StatelessWidget {
  const VersionsSubview({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Versions>(
      builder: (_, vs, __) => Container(
        decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).dividerColor),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: kElevationToShadow[1],
                  borderRadius: BorderRadius.circular(8.0).copyWith(
                      bottomLeft: Radius.zero, bottomRight: Radius.zero),
                ),
                height: _kToolbarHeight,
                child: Row(
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.add),
                      label: const Text("Add"),
                      onPressed: () async {
                        final version = await showDialog<Version?>(
                          context: context,
                          builder: (ctx) => const AddVersionDialog(),
                        );

                        if (version == null) {
                          return;
                        }

                        vs.addVersion(version);
                      },
                    ),
                    TextButton.icon(
                      icon: Stack(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(right: 4.0),
                            child: Icon(Icons.add),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: Icon(Icons.more_horiz, size: 12),
                          ),
                        ],
                      ),
                      label: const Text("Discover"),
                      onPressed: () async {
                        final versions = await showDialog<List<Version>?>(
                          context: context,
                          builder: (ctx) => const DiscoverVersionsDialog(),
                        );

                        if (versions == null) {
                          return;
                        }

                        versions.forEach(vs.addVersion);
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: _kToolbarHeight,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: VersionsList(
                    versions: vs.versions,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
