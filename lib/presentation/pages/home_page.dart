import 'package:flutter/material.dart';
import 'package:mobile/widgets/page_base.dart';

class HomePage extends StatelessWidget {
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
