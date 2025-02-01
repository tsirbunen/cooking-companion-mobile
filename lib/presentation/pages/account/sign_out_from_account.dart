import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/button_widgets/button_styled.dart';
import 'package:mobile/presentation/widgets/text_widgets/info.dart';
import 'package:mobile/presentation/widgets/text_widgets/main_title.dart';

const signOutLabel = 'SIGN OUT FROM ACCOUNT';
const info =
    'If you sign out, you will not be able to view, create, or edit your own recipes until you sign back in.';
const signOutButtonLabel = 'SIGN OUT';

class SignOutFromAccount extends StatelessWidget {
  final void Function() onSignOut;
  const SignOutFromAccount({super.key, required this.onSignOut});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          label: signOutLabel,
          type: MainTitleType.small,
        ),
        const Info(info: info),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonStyled(
              onPressed: onSignOut,
              label: signOutButtonLabel,
              styleType: StyleType.danger,
            ),
          ],
        ),
      ],
    );
  }
}
