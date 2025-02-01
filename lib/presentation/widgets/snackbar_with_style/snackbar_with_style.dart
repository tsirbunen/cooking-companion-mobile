import 'package:flutter/material.dart';
import 'package:mobile/app_services/theme/colors.dart';

final GlobalKey<ScaffoldMessengerState> snackbarKey =
    GlobalKey<ScaffoldMessengerState>();

const okLabel = 'OK';
const defaultDuration = 5000;

enum SnackbarType { success, error, info }

class SnackbarWithStyle {
  final String title;
  final String message;
  final void Function()? action;
  final SnackbarType type;
  final int? durationMilliseconds;

  SnackbarWithStyle({
    required this.title,
    required this.message,
    this.action,
    required this.type,
    this.durationMilliseconds,
  });

  show() {
    snackbarKey.currentState?.showSnackBar(SnackbarWithStyle.buildSnackbar(
      title: title,
      message: message,
      action: action,
      type: type,
      durationMilliseconds: durationMilliseconds ?? defaultDuration,
    ));
  }

  static buildSnackbar({
    required String title,
    required String message,
    int durationMilliseconds = defaultDuration,
    void Function()? action,
    SnackbarType type = SnackbarType.info,
  }) {
    return SnackBar(
      content: RichText(
        text: TextSpan(children: [
          TextSpan(
            text: '$title\n',
            style: _titleStyle(type),
          ),
          TextSpan(text: message, style: _messageStyle()),
        ]),
      ),
      duration: Duration(milliseconds: durationMilliseconds),
      action: action != null
          ? SnackBarAction(
              label: okLabel,
              onPressed: action,
              textColor: veryPale,
            )
          : null,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.only(bottom: 15.0, left: 15.0, right: 15.0),
      shape: _shape(),
    );
  }

  static TextStyle _titleStyle(SnackbarType type) {
    final color = type == SnackbarType.success
        ? success
        : type == SnackbarType.error
            ? error
            : veryPale;

    return TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color,
    );
  }

  static TextStyle _messageStyle() {
    return const TextStyle(fontSize: 18, color: veryPale);
  }

  static RoundedRectangleBorder _shape() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15.0),
      ),
    );
  }
}
