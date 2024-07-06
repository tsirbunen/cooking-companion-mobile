import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/features/recipes/application/cooking_recipe_provider/cooking_single_recipe_provider.dart';
import 'package:mobile/features/recipes/domain/models/instruction_group/instruction_group.dart'
    as models;
import 'package:mobile/features/recipes/presentation/cook_recipes/cook_single_recipe/ingredients_and_instructions/table_cell_padded.dart';
import 'package:mobile/widgets/checkbox_customizable/checkbox_customizable.dart';

const double cellPadding = 5.0;
const double checkboxPadding = 10.0;
const double rowSpacing = 10.0;
const double amountCellWidth = 60.0;
const double unitCellWidth = 70.0;
const double numberContainerBorderRadius = 5.0;
const double numberContainerWidth = 25.0;
const double numberContainerTopPadding = 3.0;

class InstructionGroup extends ConsumerWidget {
  final models.InstructionGroup group;
  final CookingProvider provider;

  const InstructionGroup(
      {super.key, required this.group, required this.provider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeData = Theme.of(context);
    final isCooking = ref.watch(provider.notifier).isCooking();
    final instructionsDone = ref.watch(provider.notifier).getInstructionsDone();

    return Padding(
      padding: const EdgeInsets.only(bottom: rowSpacing),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (group.title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: cellPadding),
              child: Text(group.title!.toUpperCase(),
                  style: themeData.textTheme.titleSmall),
            ),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.top,
            columnWidths: _getColumnWidths(isCooking),
            children: group.instructions.mapIndexed(
              (index, instruction) {
                final isDone = instructionsDone.contains(instruction.id);
                final toggleIsDone =
                    ref.read(provider.notifier).toggleInstruction;

                return TableRow(
                  children: [
                    TableCellPadded(
                      widget: Padding(
                        padding: const EdgeInsets.only(right: checkboxPadding),
                        child: isCooking
                            ? CheckboxCustomizable(
                                isSelected: isDone,
                                toggle: () => toggleIsDone(instruction.id),
                              )
                            : Container(
                                margin: const EdgeInsets.only(
                                    top: numberContainerTopPadding),
                                width: numberContainerWidth,
                                decoration:
                                    _getNumberContainerDecoration(themeData),
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: _getNumberTextStyle(themeData),
                                  ),
                                ),
                              ),
                      ),
                    ),
                    TableCellPadded(
                      text: instruction.content,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                );
              },
            ).toList(),
          )
        ],
      ),
    );
  }

  Map<int, TableColumnWidth> _getColumnWidths(bool isCooking) {
    List<TableColumnWidth> columnWidths = [];
    columnWidths.add(const IntrinsicColumnWidth());
    columnWidths.add(const FlexColumnWidth());

    return columnWidths.asMap();
  }

  BoxDecoration _getNumberContainerDecoration(ThemeData themeData) {
    return BoxDecoration(
      color: themeData.colorScheme.onPrimary,
      borderRadius: BorderRadius.circular(numberContainerBorderRadius),
    );
  }

  TextStyle _getNumberTextStyle(ThemeData themeData) {
    return TextStyle(
      color: themeData.colorScheme.onTertiaryFixed,
      fontWeight: FontWeight.bold,
    );
  }
}
