import 'package:flutter/material.dart';

enum DescriptionType { small, mediumThin }

class Description extends StatelessWidget {
  final String info;
  final DescriptionType type;

  const Description({
    super.key,
    required this.info,
    this.type = DescriptionType.small,
  });

  @override
  Widget build(BuildContext context) {
    final fontWeight =
        type == DescriptionType.mediumThin ? FontWeight.w400 : FontWeight.w500;

    final fontSize = type == DescriptionType.mediumThin ? 18.0 : 16.0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, top: 5.0),
      child: Text(
        info,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}
