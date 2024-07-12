import 'package:flutter/material.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_event.dart';
import 'package:mobile/business_logic/wizard_logic/wizard_state.dart';
import 'package:mobile/presentation/pages/wizard/create_recipe_form/elements_in_form/texts_in_form.dart';

const double borderRadius = 10.0;
const String ingredientsSubtitle = 'INGREDIENTS';
const String ingredientSheetTitle = 'INGREDIENT';
const String instructionIndexMissing = 'Instruction index is null';
const double amountWidth = 60.0;
const double unitWidth = 70.0;
const double contentSpacing = 3.0;

class IngredientsInForm extends TextsInForm {
  const IngredientsInForm({super.key});

  @override
  String get subtitle => ingredientsSubtitle;

  @override
  bool get isSimpleString => false;

  @override
  List<ElementValue> getValues(WizardState state) {
    return (state.ingredients ?? [])
        .map((i) =>
            (content: i.content, id: i.id, amount: i.amount, unit: i.unit))
        .toList();
  }

  @override
  Widget getChild(BuildContext context, ElementValue value) {
    final ThemeData themeData = Theme.of(context);
    final amountAndUnitStyle = _getAmountAndUnitStyle(themeData);

    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      decoration: _getContainerDecoration(themeData),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: amountWidth,
              margin: const EdgeInsets.only(right: contentSpacing),
              child: Text(
                value.amount != null ? value.amount.toString() : '',
                style: amountAndUnitStyle,
              ),
            ),
            Container(
              width: unitWidth,
              margin: const EdgeInsets.only(right: contentSpacing),
              child: Text(
                value.unit ?? '',
                style: amountAndUnitStyle,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: Text(value.content, style: _getNameStyle(themeData)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  WizardEvent convertValuesToEvent(List<String?>? values,
      {int? id, int? index}) {
    if (index == null) throw Exception(instructionIndexMissing);
    if (values == null) return IngredientChangedEvent(id: id, index: index);
    return IngredientChangedEvent(
        amount: values[0] != '' ? double.parse(values[0]!) : null,
        unit: values[1],
        content: values[2],
        id: id,
        index: index);
  }

  BoxDecoration _getContainerDecoration(ThemeData themeData) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(borderRadius),
      color: themeData.colorScheme.tertiaryContainer,
    );
  }

  TextStyle _getAmountAndUnitStyle(ThemeData themeData) {
    return themeData.textTheme.headlineSmall!.copyWith(
      color: themeData.colorScheme.secondaryContainer,
    );
  }

  TextStyle _getNameStyle(ThemeData themeData) {
    return themeData.textTheme.headlineSmall!.copyWith(
      fontWeight: FontWeight.normal,
      color: themeData.colorScheme.secondaryContainer,
    );
  }
}
