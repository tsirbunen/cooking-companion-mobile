import 'package:flutter/material.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/form_input_sheet/form_input_sheet_buttons.dart';
import 'package:mobile/presentation/pages/wizard/page_widgets/form_widgets/sub_title_in_form.dart';
import 'package:mobile/presentation/widgets/modal_sheet_utils/open_top_modal_sheet.dart';

const double sheetMargin = 20.0;
const double topPadding = 20.0;
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

  return await openTopModalSheet(
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
    backgroundColor: themeData.colorScheme.surface,
  );
}
