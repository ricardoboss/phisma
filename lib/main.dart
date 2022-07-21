import 'package:flutter/material.dart';
import 'package:phisma/app.dart';
import 'package:phisma/settings.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => Settings(),
    child: const PhismaApp(),
  ));
}
