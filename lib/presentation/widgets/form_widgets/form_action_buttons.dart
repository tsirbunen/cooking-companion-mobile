import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/button_widgets/button_styled.dart';

const String submitLabel = 'SUBMIT';
const String resetLabel = 'RESET';
const double buttonsSpacer = 10.0;
const double buttonFontSize = 22.0;
const double buttonsMargin = 40.0;

class FormActionButtons extends StatelessWidget {
  final void Function()? onReset;
  final void Function() onSubmit;
  final bool isSubmitting;
  final bool hasSomeValue;
  final bool hasSomeError;

  const FormActionButtons({
    super.key,
    this.onReset,
    required this.onSubmit,
    required this.isSubmitting,
    required this.hasSomeValue,
    required this.hasSomeError,
  });

  @override
  Widget build(BuildContext context) {
    final canSubmit = !isSubmitting && hasSomeValue && !hasSomeError;
    final canReset = hasSomeValue;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: buttonsMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (onReset != null)
            ButtonStyled(
              onPressed: canReset ? onReset! : null,
              label: resetLabel,
              fontSize: buttonFontSize,
              isDisabled: !canReset,
            ),
          if (onReset != null) const SizedBox(width: buttonsSpacer),
          ButtonStyled(
            onPressed: canSubmit ? onSubmit : null,
            label: submitLabel,
            fontSize: buttonFontSize,
            isDisabled: !canSubmit,
          ),
        ],
      ),
    );
  }
}
