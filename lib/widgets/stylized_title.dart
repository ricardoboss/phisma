import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class StylizedTitle extends StatelessWidget {
  const StylizedTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        const Text(
          'phisma',
          style: TextStyle(
            fontSize: 32,
            fontStyle: FontStyle.italic,
          ),
        ),
        const SizedBox(width: 10),
        AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText("PHP Installations Manager"),
            TyperAnimatedText("PHP Is Majestic"),
            TyperAnimatedText("PHP Is Mandatory"),
          ],
          isRepeatingAnimation: true,
          repeatForever: true,
          pause: const Duration(seconds: 15),
        ),
      ],
    );
  }
}
