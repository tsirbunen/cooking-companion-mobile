import 'package:flutter/material.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_event.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_state.dart';
import 'package:mobile/presentation/pages/wizard/create_recipe_form/form_widgets/text_in_container.dart';
import 'package:mobile/presentation/pages/wizard/create_recipe_form/elements_in_form/texts_in_form.dart';

const String descriptionSubtitle = 'DESCRIPTION';
const String descriptionHintText = 'Enter a description...';
const double borderRadius = 10.0;

class DescriptionInForm extends TextsInForm {
  const DescriptionInForm({super.key});

  @override
  String get subtitle => descriptionSubtitle;

  @override
  String get hintText => descriptionHintText;

  @override
  bool getShowAddButton(bool hasContent) {
    return !hasContent;
  }

  @override
  List<ElementValue> getValues(WizardState state) {
    if (state.description == null) return [];
    return [(content: state.description!, id: null, amount: null, unit: null)];
  }

  @override
  Widget getChild(BuildContext context, ElementValue value) {
    return TextInContainer(text: value.content, maxLines: 3);
  }

  @override
  WizardEvent convertValuesToEvent(List<String?>? values,
      {int? id, int? index}) {
    return DescriptionChangedEvent(content: values?[0]);
  }
}
