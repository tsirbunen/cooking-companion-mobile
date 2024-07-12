import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/app_services/logger/logger.dart';
import 'package:mobile/business_logic/cook_logic/cook_event.dart';
import 'package:mobile/business_logic/models/instruction_group/instruction_group.dart'
    as models;
import 'package:mobile/presentation/pages/cook/page_widgets/ingredients_and_instructions/table_cell_padded.dart';
import 'package:mobile/business_logic/cook_logic/cook_bloc.dart';
import 'package:mobile/business_logic/cook_logic/cook_state.dart';
import 'package:mobile/presentation/widgets/checkbox_customizable/checkbox_customizable.dart';

const double cellPadding = 5.0;
const double checkboxPadding = 10.0;
const double rowSpacing = 10.0;
const double amountCellWidth = 60.0;
const double unitCellWidth = 70.0;
const double numberContainerBorderRadius = 5.0;
const double numberContainerWidth = 25.0;
const double numberContainerTopPadding = 3.0;

class InstructionGroup extends StatelessWidget {
  final models.InstructionGroup group;
  // final CookingProvider provider;
  final int recipeId;

  const InstructionGroup(
      {super.key, required this.group, required this.recipeId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CookBloc, CookState>(builder: (
      BuildContext context,
      CookState state,
    ) {
      final themeData = Theme.of(context);
      final isCooking = state.isCooking.contains(recipeId);
      final instructionsDone = state.instructionsDoneByRecipe[recipeId] ?? [];

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

                  return TableRow(
                    children: [
                      TableCellPadded(
                        widget: Padding(
                          padding:
                              const EdgeInsets.only(right: checkboxPadding),
                          child: isCooking
                              ? CheckboxCustomizable(
                                  isSelected: isDone,
                                  toggle: () => _toggleIsDone(instruction.id),
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
    });
  }

  void _toggleIsDone(int instructionId) {
    final cookBloc = getIt.get<CookBloc>();
    cookBloc.add(ToggleInstructionDoneEvent(
      recipeId: recipeId,
      instructionId: instructionId,
    ));
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
