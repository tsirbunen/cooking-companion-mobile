import 'package:flutter/material.dart';
import 'package:mobile/business_logic/models/account/account.dart';
import 'package:mobile/business_logic/models/account/identity_provider.dart';
import 'package:mobile/presentation/pages/account/account_detail.dart';
import 'package:mobile/presentation/widgets/button_widgets/button_styled_on_row.dart';
import 'package:mobile/presentation/widgets/text_widgets/info.dart';
import 'package:mobile/presentation/widgets/text_widgets/main_title.dart';

const currentAccountLabel = 'ACCOUNT INFORMATION';
const info =
    'Here is your current account information. Feel free to edit your username.';
const editLabel = 'EDIT';
const usernameLabel = 'username';
const emailLabel = 'email';
const accountTypeLabel = 'account type';

class CurrentAccount extends StatelessWidget {
  final Account account;
  const CurrentAccount({super.key, required this.account});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final isEmailAccount = account.identityProvider == IdentityProvider.EMAIL;
    final showEmail = isEmailAccount && account.email != null;
    final accountType = account.identityProvider.accountType;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          label: currentAccountLabel,
          type: MainTitleType.small,
        ),
        const Info(info: info),
        Container(
          decoration: _getContainerDecoration(themeData),
          margin: const EdgeInsets.only(bottom: 10.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountDetail(
                  label: usernameLabel,
                  value: account.username,
                ),
                if (showEmail)
                  AccountDetail(
                    label: editLabel,
                    value: account.email!,
                  ),
                AccountDetail(label: accountTypeLabel, value: accountType),
              ],
            ),
          ),
        ),
        ButtonStyledOnRow(
          onPressed: _onStartEditingAccountDetails,
          label: editLabel,
          isDisabled: true,
        ),
      ],
    );
  }

  void _onStartEditingAccountDetails() {
    // FIXME: Implement possibility to edit account username (starting with API server)
  }

  BoxDecoration _getContainerDecoration(ThemeData themeData) {
    return BoxDecoration(
      color: themeData.colorScheme.primaryContainer,
      borderRadius: BorderRadius.circular(15),
    );
  }
}
