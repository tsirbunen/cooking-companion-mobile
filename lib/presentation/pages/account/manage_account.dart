import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/business_logic/account_logic/account_bloc.dart';
import 'package:mobile/business_logic/account_logic/account_event.dart';
import 'package:mobile/business_logic/account_logic/account_state.dart';
import 'package:mobile/app_services/logger/logger.dart';
import 'package:mobile/presentation/pages/account/current_account.dart';
import 'package:mobile/presentation/pages/account/delete_account.dart';
import 'package:mobile/presentation/pages/account/sign_out_from_account.dart';

const SizedBox spacer = SizedBox(height: 25);

class ManageAccount extends StatelessWidget {
  const ManageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountBloc, AccountState>(builder: (
      BuildContext context,
      AccountState state,
    ) {
      logger.info(state.toString(), runtimeType);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CurrentAccount(account: state.currentAccount!),
          spacer,
          SignOutFromAccount(onSignOut: () => _onSignOut(context)),
          spacer,
          DeleteAccount(onDelete: () => _onDeleteAccount(context)),
        ],
      );
    });
  }

  void _onSignOut(BuildContext context) {
    context.read<AccountBloc>().add(SignOut());
  }

  void _onDeleteAccount(BuildContext context) {
    context.read<AccountBloc>().add(DeleteAccountPermanently());
  }
}
