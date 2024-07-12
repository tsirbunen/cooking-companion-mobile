import 'package:flutter/material.dart';

class ActionConfig {
  final String label;
  final IconData iconData;
  final void Function() onPressed;

  const ActionConfig({
    required this.label,
    required this.iconData,
    required this.onPressed,
  });
}
