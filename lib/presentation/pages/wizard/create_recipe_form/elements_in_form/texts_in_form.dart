import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_bloc.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_event.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_state.dart';
import 'package:mobile/presentation/pages/wizard/create_recipe_form/form_input_sheet/form_input_sheet_item_model.dart';
import 'package:mobile/presentation/pages/wizard/create_recipe_form/form_input_sheet/form_input_sheet_wrapper.dart';
import 'package:mobile/presentation/pages/wizard/create_recipe_form/form_widgets/sub_title_in_form.dart';

const double borderRadius = 10.0;
const String amountLabel = 'AMOUNT';
const String amountHintText = 'e.g. 1.5';
const String unitLabel = 'UNIT';
const String unitHintText = 'e.g. dL';
const String contentLabel = 'NAME';
const String contentHintText = 'Enter a name (e.g. sugar)';

typedef ElementValue = ({
  int? id,
  String content,
  double? amount,
  String? unit
});

class TextsInForm extends StatelessWidget {
  String get subtitle => throw UnimplementedError();
  String get hintText => '';
  bool get isSimpleString => true;

  const TextsInForm({super.key});

  List<ElementValue> getValues(WizardState state) {
    throw UnimplementedError();
  }

  bool _getHasContent(List<ElementValue> values) => values.isNotEmpty;
  bool getShowAddButton(bool hasContent) => true;

  Widget getChild(BuildContext context, ElementValue value) {
    throw UnimplementedError();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WizardBloc, WizardState>(
      builder: (BuildContext context, WizardState state) {
        final stateValues = getValues(state);
        final hasContent = _getHasContent(stateValues);
        final showAddButton = getShowAddButton(hasContent);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SubTitleInForm(subTitle: subtitle),
            Wrap(
              alignment: WrapAlignment.start,
              children: stateValues.mapIndexed((index, value) {
                return FormInputSheetWrapper(
                  sheetTitle: subtitle,
                  inputItems: _getInputItems(
                      value.content, value.unit, value.amount?.toString()),
                  onSave: (List<String> values) =>
                      _onSave(context, values, id: value.id, index: index),
                  onDelete: () =>
                      _onDelete(context, id: value.id, index: index),
                  child: getChild(context, value),
                );
              }).toList(),
            ),
            if (showAddButton)
              FormInputSheetWrapper(
                sheetTitle: subtitle,
                inputItems: _getInputItems(null, null, null),
                onSave: (List<String> values) => _onSave(context, values,
                    id: null, index: stateValues.length),
                showNoContentYet: !hasContent,
              )
          ],
        );
      },
    );
  }

  WizardEvent convertValuesToEvent(List<String?>? values,
      {int? id, int? index}) {
    throw UnimplementedError();
  }

  void _onSave(BuildContext context, List<String?> values,
      {int? id, int? index}) {
    final event = convertValuesToEvent(values, id: id, index: index);
    context.read<WizardBloc>().add(event);
  }

  void _onDelete(BuildContext context, {int? id, int? index}) {
    final event = convertValuesToEvent(null, id: id, index: index);
    context.read<WizardBloc>().add(event);
  }

  List<FormInputSheetItem> _getInputItems(
      String? content, String? unit, String? amount) {
    List<FormInputSheetItem> items = [];
    if (!isSimpleString) {
      items.addAll([
        FormInputSheetItem(
          label: amountLabel,
          hintText: amountHintText,
          initialValue: amount,
          inputType: FormInputTypeEnum.numberHalfRow,
          maxLength: 10,
        ),
        FormInputSheetItem(
          label: unitLabel,
          hintText: unitHintText,
          initialValue: unit,
          inputType: FormInputTypeEnum.stringHalfRow,
          maxLength: 15,
        )
      ]);
    }

    items.add(FormInputSheetItem(
      label: isSimpleString ? null : contentLabel,
      hintText: isSimpleString ? hintText : contentLabel,
      initialValue: content,
      inputType: FormInputTypeEnum.stringFullRow,
      maxLength: 150,
    ));

    return items;
  }
}
