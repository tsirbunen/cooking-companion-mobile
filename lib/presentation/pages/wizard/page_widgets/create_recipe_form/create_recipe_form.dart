import 'package:flutter/material.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/elements_in_form/description_in_form.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/elements_in_form/ingredients_in_form.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/elements_in_form/instructions_in_form.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/elements_in_form/tags_in_form.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/elements_in_form/title_in_form.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/elements_in_form/form_action_buttons.dart';

class CreateRecipeForm extends StatefulWidget {
  const CreateRecipeForm({super.key});

  @override
  State<CreateRecipeForm> createState() => _CreateRecipeFormState();
}

class _CreateRecipeFormState extends State<CreateRecipeForm> {
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
          FormActionButtons(),
        ],
      ),
    );
  }
}
