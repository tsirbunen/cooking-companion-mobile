import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/core/logger/logger.dart';
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart';

ProviderObserver getProviderLoggerObserver() {
  final talker = logger.talker;

  return TalkerRiverpodObserver(
    talker: talker,
    settings: const TalkerRiverpodLoggerSettings(
      enabled: true,
      printProviderAdded: true,
      printProviderUpdated: true,
      printProviderDisposed: true,
      printProviderFailed: true,
      // Note: Do not print the full state data as it is way too verbose
      // (at least in case of multiple recipes).
      printStateFullData: false,
    ),
  );
}
