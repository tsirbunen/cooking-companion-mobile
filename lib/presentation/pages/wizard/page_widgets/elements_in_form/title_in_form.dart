import 'package:flutter/material.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_event.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_state.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/form_widgets/text_in_container.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/elements_in_form/texts_in_form.dart';

const String titleSubtitle = 'TITLE';
const String titleHintText = 'Enter the recipe title...';

class TitleInForm extends TextsInForm {
  const TitleInForm({super.key});

  @override
  String get subtitle => titleSubtitle;

  @override
  String get hintText => titleHintText;

  @override
  bool getShowAddButton(bool hasContent) {
    return !hasContent;
  }

  @override
  List<ElementValue> getValues(WizardState state) {
    if (state.title == null) return [];
    return [(content: state.title!, id: null, amount: null, unit: null)];
  }

  @override
  Widget getChild(BuildContext context, ElementValue value) {
    return TextInContainer(text: value.content, maxLines: 3);
  }

  @override
  WizardEvent convertValuesToEvent(List<String?>? values,
      {int? id, int? index}) {
    return TitleChangedEvent(content: values?[0]);
  }
}
