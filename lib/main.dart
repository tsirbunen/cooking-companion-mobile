import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/api_service/api_connection_provider.dart';
import 'package:mobile/core/app/app.dart';
import 'package:mobile/widgets/launch/launch_widget.dart';

void main() async {
  // While api server and shared preferences connections are set up
  // display a launch widget to the user.
  runApp(const LaunchWidget());

  // Initialize all services (override providers initialized with
  // no implementation with providers having the real services initialized).
  WidgetsFlutterBinding.ensureInitialized();
  final apiConnection = await getApiConnectionOverride();

  return runApp(
    ProviderScope(
      overrides: [
        apiConnection,
      ],
      child: const CookingCompanionApp(),
    ),
  );
}
