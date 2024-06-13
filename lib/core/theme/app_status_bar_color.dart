import 'package:flutter/services.dart';
import 'package:mobile/core/theme/colors.dart';

void setAppStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle().copyWith(
      statusBarColor: veryDark,
      systemNavigationBarColor: veryDark,
    ),
  );
}
