import 'package:flutter/material.dart';

const leftPadding = 20.0;
const fontSize = 20.0;

class RouteLabel extends StatelessWidget {
  final String label;
  const RouteLabel({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headlineMedium!.copyWith(
          fontSize: fontSize,
        );

    return Padding(
      padding: const EdgeInsets.only(left: leftPadding),
      child: Text(label, style: style),
    );
  }
}
