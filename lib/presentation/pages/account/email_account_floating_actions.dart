import 'package:flutter/material.dart';
import 'package:mobile/business_logic/account_logic/helper_models.dart';
import 'package:mobile/presentation/widgets/animated_floating_actions/action_config.dart';
import 'package:mobile/presentation/widgets/animated_floating_actions/animated_floating_actions.dart';

const floatingActionsMargin = 15.0;
const signUp = 'sign up';
const signIn = 'sign in';
const requestVerificationEmail = 'get email';

class EmailAccountFloatingActions extends StatelessWidget {
  final Function(EmailAccountAction action) onChangeEmailAccountAction;

  const EmailAccountFloatingActions({
    super.key,
    required this.onChangeEmailAccountAction,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0.0,
      bottom: floatingActionsMargin,
      child: AnimatedFloatingActions(
        shouldHideAfterOnPressed: true,
        actionConfigs: [
          ActionConfig(
            label: requestVerificationEmail,
            iconData: Icons.email,
            onPressed: () => onChangeEmailAccountAction(
                EmailAccountAction.requestVerificationEmail),
          ),
          ActionConfig(
            label: signUp,
            iconData: Icons.account_circle,
            onPressed: () =>
                onChangeEmailAccountAction(EmailAccountAction.signUp),
          ),
          ActionConfig(
            label: signIn,
            iconData: Icons.login,
            onPressed: () =>
                onChangeEmailAccountAction(EmailAccountAction.signIn),
          ),
        ],
      ),
    );
  }
}
