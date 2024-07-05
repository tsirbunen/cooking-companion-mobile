import 'package:flutter/material.dart';
import 'package:mobile/layers/business_logic/wizard/wizard_event.dart';
import 'package:mobile/layers/business_logic/wizard/wizard_state.dart';
import 'package:mobile/layers/presentation/wizard/create_recipe_form/form_widgets/text_in_container.dart';
import 'package:mobile/layers/presentation/wizard/create_recipe_form/form_widgets/texts_in_form.dart';

const double borderRadius = 10.0;
const String instructionsSubtitle = 'INSTRUCTIONS';
const String instructionSheetTitle = 'INSTRUCTION';
const String instructionHintText = 'Enter an instruction';

class InstructionsInForm extends TextsInForm {
  const InstructionsInForm({super.key});

  @override
  String get subtitle => instructionsSubtitle;

  @override
  String get hintText => instructionHintText;

  @override
  List<ElementValue> getValues(WizardState state) {
    return (state.instructions ?? [])
        .map((i) => (content: i.content, id: i.id, amount: null, unit: null))
        .toList();
  }

  @override
  Widget getChild(BuildContext context, ElementValue value) {
    return TextInContainer(
      text: value.content,
      maxLines: 10,
    );
  }

  @override
  WizardEvent convertValuesToEvent(List<String?>? values,
      {int? id, int? index}) {
    if (index == null) throw Exception('Instruction index is null');

    return InstructionChangedEvent(content: values?[0], id: id, index: index);
  }
}
