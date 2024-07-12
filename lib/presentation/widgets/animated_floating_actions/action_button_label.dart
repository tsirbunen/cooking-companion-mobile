import 'package:flutter/material.dart';

class ActionButtonLabel extends StatelessWidget {
  final String label;

  const ActionButtonLabel({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Material(
      color: Colors.transparent,
      child: SizedBox(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: Text(
              label.toUpperCase(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: colors.secondaryContainer,
                fontSize: 10.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
