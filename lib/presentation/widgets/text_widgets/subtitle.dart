import 'package:flutter/material.dart';

enum SubtitleType { medium }

class Subtitle extends StatelessWidget {
  final String label;
  final SubtitleType type;

  const Subtitle({
    super.key,
    required this.label,
    this.type = SubtitleType.medium,
  });

  @override
  Widget build(BuildContext context) {
    return Text(label, style: Theme.of(context).textTheme.headlineSmall);
  }
}
