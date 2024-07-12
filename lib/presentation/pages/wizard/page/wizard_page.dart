import 'package:flutter/material.dart';
import 'package:mobile/presentation/pages/wizard/create_recipe_form/form/create_recipe_form.dart';
import 'package:mobile/presentation/widgets/page_base/page_base.dart';

const double padding = 18.0;

class WizardPage extends StatelessWidget {
  const WizardPage({super.key});

  @override
  Widget build(BuildContext context) {
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
