import 'package:flutter/widgets.dart';
import 'package:mobile/presentation/widgets/button_widgets/button_styled.dart';

class ButtonStyledOnRow extends StatelessWidget {
  final String label;
  final bool isDisabled;
  final Function() onPressed;
  final MainAxisAlignment mainAxisAlignment;

  const ButtonStyledOnRow({
    super.key,
    required this.label,
    this.isDisabled = false,
    required this.onPressed,
    this.mainAxisAlignment = MainAxisAlignment.end,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        ButtonStyled(
          onPressed: onPressed,
          label: label,
          isDisabled: true,
        ),
      ],
    );
  }
}
