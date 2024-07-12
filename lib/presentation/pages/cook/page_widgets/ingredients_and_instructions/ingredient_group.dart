import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/business_logic/cook_logic/cook_event.dart';
import 'package:mobile/business_logic/models/ingredient_group/ingredient_group.dart'
    as models;
import 'package:mobile/presentation/pages/cook/page_widgets/ingredients_and_instructions/table_cell_padded.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_state.dart';
import 'package:mobile/presentation/widgets/checkbox_customizable/checkbox_customizable.dart';

const double cellPadding = 5.0;
const double rowSpacing = 10.0;
const double amountCellWidth = 60.0;
const double unitCellWidth = 70.0;

class IngredientGroup extends StatelessWidget {
  final models.IngredientGroup group;
  final int recipeId;

  // final CookingProvider provider;

  const IngredientGroup(
      {super.key, required this.group, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CookBloc, CookState>(builder: (
      BuildContext context,
      CookState state,
    ) {
      final themeData = Theme.of(context);
      final isCooking = state.isCooking.contains(recipeId);
      final addedIngredients = state.ingredientsAddedByRecipe[recipeId] ?? [];

      return Padding(
        padding: const EdgeInsets.only(bottom: rowSpacing),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (group.title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: cellPadding),
              child: Text(group.title!.toUpperCase(),
                  style: themeData.textTheme.titleSmall),
            ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            columnWidths: _getColumnWidths(isCooking),
            children: group.ingredients.map(
              (ingredient) {
                final isAdded = addedIngredients.contains(ingredient.id);

                return TableRow(
                  children: [
                    if (isCooking)
                      TableCellPadded(
                        widget: Padding(
                          padding: const EdgeInsets.only(right: cellPadding),
                          child: CheckboxCustomizable(
                            isSelected: isAdded,
                            toggle: () => _toggleIsAdded(ingredient.id),
                          ),
                        ),
                      ),
                    TableCellPadded(text: ingredient.amount?.toString() ?? ''),
                    TableCellPadded(text: ingredient.unit ?? ''),
                    TableCellPadded(text: ingredient.name),
                  ],
                );
              },
            ).toList(),
          )
        ]),
      );
    });
  }

  void _toggleIsAdded(int ingredientId) {
    final cookBloc = getIt.get<CookBloc>();
    cookBloc.add(ToggleIngredientAddedEvent(
      recipeId: recipeId,
      ingredientId: ingredientId,
    ));
  }

  Map<int, TableColumnWidth> _getColumnWidths(bool isCooking) {
    List<TableColumnWidth> columnWidths = [];
    if (isCooking) columnWidths.add(const IntrinsicColumnWidth());

    columnWidths.addAll([
      const FixedColumnWidth(amountCellWidth),
      const FixedColumnWidth(unitCellWidth),
      const FlexColumnWidth()
    ]);

    return columnWidths.asMap();
  }
}
