import 'package:flutter/material.dart';
import 'package:mobile/business_logic/account_logic/helper_models.dart';
import 'package:mobile/presentation/widgets/modal_sheet_utils/modal_sheet_action_buttons.dart';
import 'package:mobile/presentation/widgets/modal_sheet_utils/modal_sheet_title_and_close_row.dart';
import 'package:mobile/presentation/widgets/text_widgets/description.dart';

const maxLength = 60;
const double sheetMargin = 20.0;
const double sheetMinHeight = 300.0;
const EdgeInsets contentPadding = EdgeInsets.all(20.0);

class ModalSheetContentWithTextInput extends StatefulWidget {
  final String title;
  final String? info;
  final Function() onClose;
  final Function() onSave;
  final TextEditingController controller;
  final ValidatorFn? validateFn;
  final Function()? onVisibilityChanged;
  final bool isVisible;

  const ModalSheetContentWithTextInput({
    super.key,
    required this.title,
    this.info,
    required this.onClose,
    required this.validateFn,
    required this.onSave,
    required this.controller,
    this.onVisibilityChanged,
    this.isVisible = true,
  });

  @override
  State<ModalSheetContentWithTextInput> createState() =>
      _ModalSheetContentWithTextInputState();
}

class _ModalSheetContentWithTextInputState
    extends State<ModalSheetContentWithTextInput> {
  // Note: We need to keep this state also locally to enable visibility change
  // take effect in the text form field
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = widget.isVisible;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final width = screenSize.width;
    final ThemeData themeData = Theme.of(context);
    final Color color = themeData.colorScheme.onTertiary;

    return Container(
      width: width,
      constraints: const BoxConstraints(minHeight: sheetMinHeight),
      margin: const EdgeInsets.all(sheetMargin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ModalSheetTitleAndCloseRow(
              title: widget.title, onClose: widget.onClose),
          LayoutBuilder(builder: (
            BuildContext context,
            BoxConstraints constraints,
          ) {
            return SizedBox(
              width: constraints.maxWidth,
              child: Column(
                children: [
                  if (widget.info != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 0.0),
                      child: Description(info: widget.info!),
                    ),
                  TextFormField(
                    controller: widget.controller,
                    autofocus: true,
                    decoration: _textFormFieldDecoration(
                      themeData,
                      widget.onVisibilityChanged,
                    ),
                    maxLength: maxLength,
                    minLines: 1,
                    style:
                        themeData.textTheme.titleMedium!.copyWith(color: color),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: widget.validateFn,
                    obscureText: !isVisible,
                    obscuringCharacter: '•',
                  ),
                ],
              ),
            );
          }),
          ModalSheetActionButtons(onSave: widget.onSave),
        ],
      ),
    );
  }

  InputDecoration _textFormFieldDecoration(
    ThemeData themeData,
    void Function()? onVisibilityChanged,
  ) {
    final colors = themeData.colorScheme;
    final borderSide = BorderSide(width: 3.0, color: colors.tertiary);
    final borderRadius = BorderRadius.circular(50.0);
    final border =
        OutlineInputBorder(borderSide: borderSide, borderRadius: borderRadius);

    return InputDecoration(
      suffixIcon: onVisibilityChanged != null
          ? _getVisibilityIcon(onVisibilityChanged, themeData)
          : null,
      filled: true,
      fillColor: colors.primaryContainer,
      contentPadding: contentPadding,
      enabledBorder: border,
      focusedBorder: border,
      counterStyle: themeData.textTheme.titleSmall!.copyWith(
        color: colors.tertiaryContainer,
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 3.0, color: colors.error),
          borderRadius: borderRadius),
      errorStyle: themeData.textTheme.titleSmall!.copyWith(
        color: colors.error,
        fontWeight: FontWeight.bold,
      ),
      errorMaxLines: 3,
    );
  }

  _getVisibilityIcon(void Function() onVisibilityChanged, ThemeData themeData) {
    return GestureDetector(
      onTap: () {
        onVisibilityChanged();
        setState(() => isVisible = !isVisible);
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Icon(
          color: themeData.colorScheme.tertiary,
          isVisible ? Icons.visibility_off : Icons.visibility,
          size: 30.0,
        ),
      ),
    );
  }
}
