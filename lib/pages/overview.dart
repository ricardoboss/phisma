import 'package:flutter/material.dart';
import 'package:phisma/models/version.dart';
import 'package:provider/provider.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const Text('Overview'),
            SizedBox(
              height: 200,
              child: SingleChildScrollView(
                child: ChangeNotifierProvider(
                  create: (_) => Version("C:\\Program Files\\PHP_\\php-8.2.0beta1-nts-Win32-vs16-x64"),
                  builder: (ctx, _) => Center(
                    child: Text(ctx.watch<Version>().toString()),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 200,
              child: SingleChildScrollView(
                child: Center(
                  child: Text('Settings'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}