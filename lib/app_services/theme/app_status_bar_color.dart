import 'package:flutter/services.dart';
import 'package:mobile/app_services/theme/colors.dart';

void setAppStatusBarColor() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle().copyWith(
      statusBarColor: veryDark,
      systemNavigationBarColor: veryDark,
    ),
  );
}
