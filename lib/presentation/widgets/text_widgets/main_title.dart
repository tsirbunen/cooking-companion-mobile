import 'package:flutter/material.dart';

enum MainTitleType { medium, mini, midi, small }

class MainTitle extends StatelessWidget {
  final String label;
  final MainTitleType type;

  const MainTitle({
    super.key,
    required this.label,
    this.type = MainTitleType.medium,
  });

  @override
  Widget build(BuildContext context) {
    if (type == MainTitleType.mini) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 0.0, top: 5.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      );
    }

    if (type == MainTitleType.midi) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 5.0, top: 0.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w800,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
      );
    }

    if (type == MainTitleType.small) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 0.0, top: 5.0),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.onTertiary,
          ),
        ),
      );
    }

    return Text(label, style: Theme.of(context).textTheme.headlineLarge);
  }
}
