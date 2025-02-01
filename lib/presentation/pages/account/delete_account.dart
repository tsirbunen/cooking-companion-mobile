import 'package:flutter/material.dart';
import 'package:mobile/presentation/widgets/button_widgets/button_styled.dart';
import 'package:mobile/presentation/widgets/switch_widgets/switch_with_info.dart';
import 'package:mobile/presentation/widgets/text_widgets/info.dart';
import 'package:mobile/presentation/widgets/text_widgets/main_title.dart';

const deleteAccountLabel = 'DELETE ACCOUNT';
const info =
    'If you delete your account, all your data will be permanently removed from the database.';
const iUnderstandDeleteIsIrreversibleLabel =
    'I understand that this action is irreversible, and that it cannot be undone no matter what';
const proceedDeleteAllLabel =
    'I want to proceed with deleting my account and all my data';
const deleteAccountButtonLabel = 'DELETE';

class DeleteAccount extends StatefulWidget {
  final void Function() onDelete;
  const DeleteAccount({super.key, required this.onDelete});

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  bool understandingConfirmed = false;
  bool deletingConfirmed = false;

  @override
  Widget build(BuildContext context) {
    final deleteIsDisabled = !understandingConfirmed || !deletingConfirmed;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const MainTitle(
          label: deleteAccountLabel,
          type: MainTitleType.small,
        ),
        const Info(info: info),
        SwitchWithInfo(
          info: iUnderstandDeleteIsIrreversibleLabel,
          currentValue: understandingConfirmed,
          onChanged: _onUnderstandChanged,
        ),
        SwitchWithInfo(
          info: proceedDeleteAllLabel,
          currentValue: deletingConfirmed,
          onChanged: _onConfirmChanged,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ButtonStyled(
              onPressed: widget.onDelete,
              label: deleteAccountButtonLabel,
              styleType: StyleType.danger,
              isDisabled: deleteIsDisabled,
            ),
          ],
        ),
      ],
    );
  }

  void _onUnderstandChanged(bool value) {
    setState(() => understandingConfirmed = value);
  }

  void _onConfirmChanged(bool value) {
    setState(() => deletingConfirmed = value);
  }
}
