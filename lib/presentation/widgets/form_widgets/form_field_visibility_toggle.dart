import 'package:flutter/material.dart';

/// A GestureDetector with an icon that shows if visibility is on or off.
/// Meant to be used within a text input form field (for example hide / show password).
class FormFieldVisibilityToggle extends StatelessWidget {
  final bool isVisible;
  final Function() onVisibilityChanged;

  const FormFieldVisibilityToggle({
    super.key,
    required this.isVisible,
    required this.onVisibilityChanged,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final icon = isVisible ? Icons.visibility_off : Icons.visibility;

    return GestureDetector(
      onTap: onVisibilityChanged,
      child: Container(
        width: 50.0,
        height: 30.0,
        margin: const EdgeInsets.only(right: 5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              color: themeData.colorScheme.tertiary,
              icon,
              size: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
