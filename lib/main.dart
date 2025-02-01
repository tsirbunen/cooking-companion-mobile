import 'package:flutter/material.dart';
import 'package:mobile/app_services/app/app.dart';
import 'package:mobile/app_services/blocs/blocs.dart';
import 'package:mobile/app_services/theme/app_status_bar_color.dart';
import 'package:mobile/presentation/widgets/launch/launch_widget.dart';

void main() async {
  setAppStatusBarColor();

  // Note: While the connections to the api server and the shared preferences
  // are being set up, display a launch widget to the user.
  runApp(const LaunchWidget());

  WidgetsFlutterBinding.ensureInitialized();

  // Note: We use the getIt service locator to help us manage our dependencies and
  // to make bloc-to-bloc communication easier.
  prepareBlocs();

  return runApp(
    const CookingCompanionApp(),
  );
}
