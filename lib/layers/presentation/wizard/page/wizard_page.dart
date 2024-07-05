import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/layers/presentation/wizard/create_recipe_form/form/create_recipe_form.dart';
import 'package:mobile/widgets/page_base/page_base.dart';

const double padding = 18.0;

class WizardPage extends ConsumerWidget {
  const WizardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const PageBase(
        isDarkBackground: true,
        pageBody: Padding(
          padding: EdgeInsets.all(padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CreateRecipeForm(),
            ],
          ),
        ));
  }
}
