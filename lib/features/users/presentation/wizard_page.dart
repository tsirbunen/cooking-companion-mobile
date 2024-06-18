import 'package:flutter/material.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

class WizardPage extends StatelessWidget {
  const WizardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBase(
      pageBody: Center(
        child: Column(
          children: [
            Text('Content coming soon!'),
          ],
        ),
      ),
    );
  }
}
