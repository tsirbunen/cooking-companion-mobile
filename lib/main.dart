import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/api_service/api_client_provider.dart';
import 'package:mobile/core/app/app.dart';
import 'package:mobile/widgets/launch/launch_widget.dart';

void main() async {
  // Note: While the connections to the api server and the shared preferences
  // are being set up, display a launch widget to the user.
  runApp(const LaunchWidget());

  WidgetsFlutterBinding.ensureInitialized();
  // Note: Many service providers are initialized with "No implementation".
  // Once the real services have been initialized, override the the providers.
  final apiClientProviderOverride = await getApiClientOverride();

  return runApp(
    ProviderScope(
      overrides: [
        apiClientProviderOverride,
      ],
      child: const CookingCompanionApp(),
    ),
  );
}
