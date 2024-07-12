import 'package:flutter/material.dart';
import 'package:mobile/presentation/pages/wizard/create_recipe_form/form_input_sheet/form_input_sheet_buttons.dart';
import 'package:mobile/presentation/pages/wizard/create_recipe_form/form_widgets/sub_title_in_form.dart';
import 'package:mobile/presentation/widgets/modal_sheets/show_top_modal_sheet.dart';

const double sheetMargin = 20.0;
const double topPadding = 20.0;
const double borderRadius = 20.0;
const double sheetMinHeight = 300.0;

// Note: Use named required parameters especially to avoid possible mix-ups
// with the action functions.
Future<String?> openFormInputSheet({
  required BuildContext context,
  required String subTitle,
  required Widget content,
  void Function()? onDelete,
  required void Function() onCancel,
  required void Function() onSave,
}) async {
  final screenSize = MediaQuery.of(context).size;
  final width = screenSize.width;
  final ThemeData themeData = Theme.of(context);

  return await showTopModalSheet(
    context,
    Container(
      width: width,
      constraints: const BoxConstraints(
        minHeight: sheetMinHeight,
      ),
      child: Container(
        margin: const EdgeInsets.all(sheetMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: topPadding),
            SubTitleInForm(
              subTitle: subTitle,
              isDarkTheme: false,
            ),
            content,
            FormInputSheetButtons(
              onDelete: onDelete,
              onCancel: onCancel,
              onSave: onSave,
            )
          ],
        ),
      ),
    ),
    // Note: Prevent user from dismissing the sheet by tapping outside
    // of it so that we can easily clear the text editing controller
    // on closing the sheet.
    barrierDismissible: false,
    backgroundColor: themeData.colorScheme.surface,
    borderRadius: const BorderRadius.vertical(
      bottom: Radius.circular(borderRadius),
    ),
  );
}
