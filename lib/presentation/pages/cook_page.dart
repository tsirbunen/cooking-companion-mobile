import 'package:flutter/material.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

class CookPage extends StatelessWidget {
  static const String path = '/cook';

  const CookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBase(
      pageBody: Center(
        child: Text('COOK'),
      ),
    );
  }
}
