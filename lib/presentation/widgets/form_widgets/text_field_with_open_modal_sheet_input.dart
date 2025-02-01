import 'package:flutter/material.dart';
import 'package:mobile/business_logic/account_logic/helper_models.dart';
import 'package:mobile/presentation/widgets/form_widgets/form_field_error_or_spacing.dart';
import 'package:mobile/presentation/widgets/form_widgets/touchable_text_input_look_alike.dart';
import 'package:mobile/presentation/widgets/modal_sheet_utils/modal_sheet_content_with_text_input.dart';
import 'package:mobile/presentation/widgets/modal_sheet_utils/open_top_modal_sheet.dart';

/// A text field with a modal sheet input. When the user is not editing the text,
/// it is displayed as text that looks like an input. When the user taps on the
/// text container, a top modal sheet opens up with the actual text form field.
class TextFieldWithOpenModalSheetInput extends StatefulWidget {
  final String label;
  final String? info;
  final String? value;
  final bool isTouched;
  final void Function(String) onChanged;
  final ValidatorFn? validateFn;
  final bool isVisible;
  final Function()? onVisibilityChanged;

  const TextFieldWithOpenModalSheetInput({
    super.key,
    required this.label,
    required this.onChanged,
    this.info,
    this.value,
    this.validateFn,
    this.isTouched = false,
    this.isVisible = true,
    this.onVisibilityChanged,
  });

  @override
  State<TextFieldWithOpenModalSheetInput> createState() =>
      _TextFieldWithOpenModalSheetInputState();
}

class _TextFieldWithOpenModalSheetInputState
    extends State<TextFieldWithOpenModalSheetInput> {
  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.text = widget.value ?? '';
    });
  }

  @override
  void didUpdateWidget(covariant TextFieldWithOpenModalSheetInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != oldWidget.value) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        controller.text = widget.value ?? '';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TouchableTextInputLookAlike(
          value: widget.value,
          label: widget.label,
          onTap: () => _openTopModalSheetWithTextInput(context),
          isVisible: widget.isVisible,
          onVisibilityChanged: widget.onVisibilityChanged,
        ),
        ErrorOrSpacingForFormField(
          error: _getValidationError(),
        ),
      ],
    );
  }

  void _openTopModalSheetWithTextInput(BuildContext context) async {
    return await openTopModalSheet(
      context,
      ModalSheetContentWithTextInput(
        title: widget.label,
        info: widget.info,
        onClose: () => _onClose(context),
        onSave: () => _onSave(context),
        controller: controller,
        validateFn: widget.validateFn,
        onVisibilityChanged: widget.onVisibilityChanged,
        isVisible: widget.isVisible,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
    );
  }

  void _onClose(BuildContext context) {
    Navigator.of(context).pop();
    controller.text = widget.value ?? '';
  }

  void _onSave(BuildContext context) {
    Navigator.of(context).pop();
    final currentValue = controller.text.trim();
    widget.onChanged(currentValue);
  }

  String? _getValidationError() {
    return widget.isTouched && widget.validateFn != null
        ? widget.validateFn!(widget.value)
        : null;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
