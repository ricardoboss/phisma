import 'package:flutter/material.dart';

class StylizedCircularProgressIndicator extends StatefulWidget {
  final double? value;

  const StylizedCircularProgressIndicator({super.key, this.value});

  @override
  State<StylizedCircularProgressIndicator> createState() =>
      _StylizedCircularProgressIndicatorState();
}

class _StylizedCircularProgressIndicatorState
    extends State<StylizedCircularProgressIndicator> {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator.adaptive(
      value: widget.value,
      strokeWidth: 1.5,
    );
  }
}
