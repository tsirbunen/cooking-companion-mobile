import 'package:flutter/material.dart';

const contentsTitle = 'CONTENTS';
const verticalPadding = 20.0;

class RouteHeader extends StatelessWidget {
  const RouteHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.headlineMedium;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: verticalPadding,
      ),
      child: Text(contentsTitle, style: style),
    );
  }
}
