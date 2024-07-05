import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/layers/presentation/wizard/create_recipe_form/elements_in_form/description_in_form.dart';
import 'package:mobile/layers/presentation/wizard/create_recipe_form/elements_in_form/ingredients_in_form.dart';
import 'package:mobile/layers/presentation/wizard/create_recipe_form/elements_in_form/instructions_in_form.dart';
import 'package:mobile/layers/presentation/wizard/create_recipe_form/elements_in_form/tags_in_form.dart';
import 'package:mobile/layers/presentation/wizard/create_recipe_form/elements_in_form/title_in_form.dart';

class CreateRecipeForm extends ConsumerStatefulWidget {
  const CreateRecipeForm({super.key});

  @override
  CreateRecipeFormState createState() => CreateRecipeFormState();
}

class CreateRecipeFormState extends ConsumerState<CreateRecipeForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TitleInForm(),
          DescriptionInForm(),
          TagsInForm(),
          IngredientsInForm(),
          InstructionsInForm(),
        ],
      ),
    );
  }
}
