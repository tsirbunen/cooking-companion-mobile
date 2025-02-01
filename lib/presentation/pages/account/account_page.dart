import 'package:flutter/material.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/presentation/pages/account/email_account_form.dart';
import 'package:mobile/presentation/pages/account/manage_account.dart';
import 'package:mobile/presentation/pages/account/account_type_selection.dart';
import 'package:mobile/presentation/pages/account/display_possible_account_status_message.dart';
import 'package:mobile/presentation/widgets/page_base/page_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/account_logic/account_bloc.dart';
import 'package:mobile/business_logic/account_logic/account_state.dart';
import 'package:mobile/app_services/logger/logger.dart';

const double padding = 25.0;

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  AccountType? accountType;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AccountBloc, AccountState>(
      listener: displayPossibleAccountStatusMessage,
      child: BlocBuilder<AccountBloc, AccountState>(builder: (
        BuildContext context,
        AccountState state,
      ) {
        logger.info(state.toString(), runtimeType);

        Widget content;
        if (_isSignedIn(state)) {
          content = const ManageAccount();
        } else if (accountType == AccountType.email) {
          content = EmailAccountForm(onCloseForm: _clearAccountType);
        } else {
          content = AccountTypeSelection(onTypeChanged: _onAccountTypeChanged);
        }

        return PageBase(
          showProgressIndicator: state.status.status == Status.submitting,
          pageBody: Padding(
            padding: const EdgeInsets.all(padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [content],
            ),
          ),
        );
      }),
    );
  }

  void _onAccountTypeChanged(AccountType? accountType) {
    setState(() => this.accountType = accountType);
  }

  void _clearAccountType() => _onAccountTypeChanged(null);

  bool _isSignedIn(AccountState state) {
    return state.currentAccount != null && state.currentAccount!.token != null;
  }
}
