import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/page_base/page_base.dart';

class SettingsPage extends StatelessWidget {
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
