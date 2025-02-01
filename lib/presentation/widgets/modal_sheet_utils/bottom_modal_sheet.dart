import 'package:flutter/material.dart';

const double padding = 20.0;

class BottomModalSheet extends StatelessWidget {
  final String title;
  final Widget body;
  const BottomModalSheet({
    super.key,
    required this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.headlineMedium;

    return Padding(
      padding: const EdgeInsets.all(padding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: padding),
            child: Text(title, style: titleStyle),
          ),
          body,
        ],
      ),
    );
  }
}
