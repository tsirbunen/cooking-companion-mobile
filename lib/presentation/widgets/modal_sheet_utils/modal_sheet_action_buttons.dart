import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/button_widgets/button_styled.dart';

const String saveLabel = 'SAVE';
const double padding = 20.0;
const double spacing = 5.0;
const double labelFontSize = 19.0;
const double buttonTextPadding = 15.0;

class ModalSheetActionButtons extends StatelessWidget {
  final void Function() onSave;

  const ModalSheetActionButtons({
    super.key,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          ButtonStyled(
            onPressed: onSave,
            label: saveLabel,
            fontSize: labelFontSize,
          ),
        ],
      ),
    );
  }
}
