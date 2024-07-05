import 'package:flutter/material.dart';
import 'package:mobile/layers/business_logic/wizard/wizard_event.dart';
import 'package:mobile/layers/business_logic/wizard/wizard_state.dart';
import 'package:mobile/layers/presentation/wizard/create_recipe_form/form_widgets/texts_in_form.dart';
import 'package:mobile/widgets/tag_with_hashtag/tag_with_hashtag.dart';

const String tagsSubtitle = 'TAGS';
const String tagSheetTitle = 'TAG';
const String tagHintText = 'Enter a tag';
const String noTagsYet = 'No tags yet';
const String tagIndexMissing = 'Tag index is null';

const EdgeInsets tagPadding =
    EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0);

class TagsInForm extends TextsInForm {
  const TagsInForm({super.key});

  @override
  String get subtitle => tagsSubtitle;

  @override
  String get hintText => tagHintText;

  @override
  List<ElementValue> getValues(WizardState state) {
    return (state.tags ?? [])
        .map((i) => (content: i.content, id: i.id, amount: null, unit: null))
        .toList();
  }

  @override
  Widget getChild(BuildContext context, ElementValue value) {
    return Padding(
      padding: tagPadding,
      child: TagWithHashtag(
        tagElement: (content: value.content, id: value.id),
        isDarkTheme: true,
      ),
    );
  }

  @override
  WizardEvent convertValuesToEvent(List<String?>? values,
      {int? id, int? index}) {
    if (index == null) throw Exception(tagIndexMissing);
    return TagChangedEvent(content: values?[0], index: index, id: id);
  }
}
