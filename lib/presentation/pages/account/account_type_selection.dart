import 'package:flutter/material.dart';
import 'package:mobile/presentation/pages/account/account_type_option.dart';
import 'package:mobile/presentation/widgets/text_widgets/info.dart';

enum AccountType { email, gitHub }

const double labelLineHeight = 1.75;
const info =
    'To create or edit recipes you need an account. With an email account, you will need to verify your email address. With a GitHub account, you will be redirected to GitHub to perform the sign-in.';
const withEmailButtonLabel = 'WITH EMAIL';
const withGitHubButtonLabel = 'WITH GITHUB';

class AccountTypeSelection extends StatelessWidget {
  final Function(AccountType accountType) onTypeChanged;
  const AccountTypeSelection({super.key, required this.onTypeChanged});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Info(info: info),
      AccountTypeOption(
        buttonLabel: withEmailButtonLabel,
        onPressed: () => onTypeChanged(AccountType.email),
      ),
      AccountTypeOption(
        buttonLabel: withGitHubButtonLabel,
        onPressed: () => onTypeChanged(AccountType.gitHub),
        isDisabled: true,
      ),
    ]);
  }
}
