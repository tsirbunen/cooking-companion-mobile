import 'package:flutter/material.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

class SettingsPage extends StatelessWidget {
  static const String path = '/settings';

  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBase(
      pageBody: Center(
        child: Text('SETTINGS'),
      ),
    );
  }
}
