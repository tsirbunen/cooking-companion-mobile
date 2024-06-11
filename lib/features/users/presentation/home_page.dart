import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/initial_recipes_provider.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

// class SearchPage extends StatelessWidget {
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // FIXME: Remove these temporary testing lines
    final valueAsync = ref.watch(initialRecipesProvider);
    valueAsync.when(
      data: (data) => print('DATA ${data?.length}'),
      loading: () => print('LOADING HOME'),
      error: (error, stackTrace) => print('error $error'),
    );

    return const PageBase(
      pageBody: Center(
        child: Column(
          children: [
            Text('HOME'),
          ],
        ),
      ),
    );
  }
}
