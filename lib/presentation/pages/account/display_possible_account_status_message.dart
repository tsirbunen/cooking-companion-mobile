import 'package:flutter/material.dart';
import 'package:mobile/business_logic/account_logic/account_state.dart';
import 'package:mobile/business_logic/models/bloc_status/bloc_status.dart';
import 'package:mobile/presentation/widgets/snackbar_with_style/snackbar_with_style.dart';

const successTitle = 'Success!';
const successDuration = 4000;
const errorTitle = 'Oops!';
const defaultErrorMessage = 'Something went wrong...';
const errorDuration = 10000;

displayPossibleAccountStatusMessage(BuildContext _, AccountState state) {
  final BlocStatus blocStatus = state.status;
  final Status status = blocStatus.status;
  final String? message = blocStatus.message;

  if (status == Status.success && message != null) {
    SnackbarWithStyle(
      title: successTitle,
      message: message,
      action: () => {},
      type: SnackbarType.success,
      durationMilliseconds: successDuration,
    ).show();
  }

  if (status == Status.error) {
    SnackbarWithStyle(
      title: errorTitle,
      message: blocStatus.message ?? defaultErrorMessage,
      action: () => {},
      type: SnackbarType.error,
      durationMilliseconds: errorDuration,
    ).show();
  }
}
