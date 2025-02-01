import 'package:flutter/material.dart';

const double iconSize = 30.0;

class FormCloseButton extends StatelessWidget {
  final void Function() onCloseForm;

  const FormCloseButton({super.key, required this.onCloseForm});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.antiAlias,
      child: Center(
        child: Ink(
          decoration: ShapeDecoration(
            color: themeData.colorScheme.surface,
            shape: const CircleBorder(),
          ),
          child: IconButton(
            icon: const Icon(Icons.close, size: iconSize),
            color: themeData.colorScheme.secondaryContainer,
            onPressed: onCloseForm,
          ),
        ),
      ),
    );
  }
}
