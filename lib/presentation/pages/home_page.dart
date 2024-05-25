import 'package:flutter/material.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

class HomePage extends StatelessWidget {
  static const String path = '/';

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBase(
      pageBody: Center(
        child: Text('HOME'),
      ),
    );
  }
}
