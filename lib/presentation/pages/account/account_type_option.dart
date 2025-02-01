import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/button_widgets/button_styled.dart';

const padding = EdgeInsets.only(top: 20.0);

class AccountTypeOption extends StatelessWidget {
  final String buttonLabel;
  final Function() onPressed;
  final bool isDisabled;

  const AccountTypeOption({
    super.key,
    required this.buttonLabel,
    required this.onPressed,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(
          child: ButtonStyled(
            onPressed: onPressed,
            label: buttonLabel,
            isDisabled: isDisabled,
          ),
        ),
      ]),
    );
  }
}
