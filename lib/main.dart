import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/api_service/api_service_provider.dart';
import 'package:mobile/core/app/app.dart';
import 'package:mobile/core/logger/provider_logger_logger.dart';
import 'package:mobile/core/theme/app_status_bar_color.dart';
import 'package:mobile/widgets/launch/launch_widget.dart';

void main() async {
  setAppStatusBarColor();

  // Note: While the connections to the api server and the shared preferences
  // are being set up, display a launch widget to the user.
  runApp(const LaunchWidget());

  WidgetsFlutterBinding.ensureInitialized();
  // Note: Many service providers are initialized with "No implementation".
  // Here we initialize them asynchronously for real, and then override the
  // respective providers.
  final apiServiceProviderOverride = await getApiServiceProviderOverride();

  // Note: During development, we want to log the provider changes.
  final providerLoggerObserver = getProviderLoggerObserver();

  return runApp(
    ProviderScope(
      overrides: [
        apiServiceProviderOverride,
      ],
      observers: [
        providerLoggerObserver,
      ],
      child: const CookingCompanionApp(),
    ),
  );
}
