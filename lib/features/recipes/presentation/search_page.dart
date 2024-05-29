import 'package:flutter/material.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const PageBase(
      pageBody: Center(
        child: Text('SEARCH'),
      ),
    );
  }
}
