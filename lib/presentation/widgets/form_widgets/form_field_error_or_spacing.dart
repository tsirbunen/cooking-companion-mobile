import 'package:flutter/material.dart';

class ErrorOrSpacingForFormField extends StatelessWidget {
  final String? error;

  const ErrorOrSpacingForFormField({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    if (error != null) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15.0, left: 20.0),
        child: Text(
          error!,
          style: themeData.textTheme.titleSmall!.copyWith(
            color: themeData.colorScheme.error,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    }

    return const SizedBox(height: 15.0);
  }
}
