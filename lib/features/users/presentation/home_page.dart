// import 'package:flutter/material.dart';
// import 'package:mobile/widgets/page_base/page_base.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const PageBase(
//       pageBody: Center(
//         child: Text('HOME'),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/initial_recipes_provider.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

// class SearchPage extends StatelessWidget {
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueAsync = ref.watch(initialRecipesProvider);
    final initialRecipes = valueAsync.when(
      data: (data) {
        print('initialRecipes: ${data.value?.length}');

        return data;
      },
      loading: () {
        print('LOADING HOME');

        return null;
      },
      error: (error, stackTrace) => null,
    );

    return PageBase(
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
