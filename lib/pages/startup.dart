import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phisma/pages/overview.dart';
import 'package:phisma/widgets/stylized_circular_progress_indicator.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({super.key});

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  late final StreamController<Future> _tasksController;

  String _message = 'Loading...';
  bool _showProgress = false;
  double _progress = 0.0;

  _StartupPageState() {
    _tasksController = StreamController<Future>();
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      await for (final task in _tasksController.stream) {
        await task;
      }
    });

    _addDefaultTasks();
  }

  @override
  void dispose() {
    super.dispose();

    _tasksController.close();
  }

  void _addDefaultTasks() {
    _tasksController.add(
      Future.delayed(
        const Duration(seconds: 1),
        () {
          setState(() {
            _message = 'done!';
          });

          if (!mounted) return;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const OverviewPage()));
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_message),
            Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: StylizedCircularProgressIndicator(
                  value: _showProgress ? _progress : null,
                )),
          ],
        ),
      ),
    );
  }
}
