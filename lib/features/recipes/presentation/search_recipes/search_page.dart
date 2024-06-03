import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/initial_recipes_provider.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

// class SearchPage extends StatelessWidget {
class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageBase(
      pageBody: Center(
        child: Column(
          children: [
            Text('SEARCH'),
          ],
        ),
      ),
    );
  }
}