import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/cooking_single_recipe_provider.dart';
import 'package:mobile/features/recipes/domain/models/ingredient_group/ingredient_group.dart'
    as models;
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_single_recipe/ingredients_and_instructions/table_cell_padded.dart';
import 'package:mobile/widgets/checkbox_customizable/checkbox_customizable.dart';

const double cellPadding = 5.0;
const double rowSpacing = 10.0;
const double amountCellWidth = 60.0;
const double unitCellWidth = 70.0;

class IngredientGroup extends ConsumerWidget {
  final models.IngredientGroup group;
  final CookingProvider provider;

  const IngredientGroup(
      {super.key, required this.group, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = Theme.of(context);
    final isCooking = ref.watch(provider.notifier).isCooking();
    final addedIngredients = ref.watch(provider.notifier).getIngredientsAdded();

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
              final toggleIsAdded =
                  ref.read(provider.notifier).toggleIngredient;

              return TableRow(
                children: [
                  if (isCooking)
                    TableCellPadded(
                      widget: Padding(
                        padding: const EdgeInsets.only(right: cellPadding),
                        child: CheckboxCustomizable(
                          isSelected: isAdded,
                          toggle: () => toggleIsAdded(ingredient.id),
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
    // return Table(
    //   defaultVerticalAlignment: TableCellVerticalAlignment.top,
    //   columnWidths: _getColumnWidths(isCooking),
    //   children: group.ingredients.map(
    //     (ingredient) {
    //       final isAdded = addedIngredients.contains(ingredient.id);
    //       final toggleIsAdded = ref.read(provider.notifier).toggleIngredient;

    //       return TableRow(
    //         children: [
    //           if (isCooking)
    //             TableCellPadded(
    //               widget: Padding(
    //                 padding: const EdgeInsets.only(right: cellPadding),
    //                 child: CheckboxCustomizable(
    //                   isSelected: isAdded,
    //                   toggle: () => toggleIsAdded(ingredient.id),
    //                 ),
    //               ),
    //             ),
    //           TableCellPadded(text: ingredient.amount?.toString() ?? ''),
    //           TableCellPadded(text: ingredient.unit ?? ''),
    //           TableCellPadded(text: ingredient.name),
    //         ],
    //       );
    //     },
    //   ).toList(),
    // );
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
