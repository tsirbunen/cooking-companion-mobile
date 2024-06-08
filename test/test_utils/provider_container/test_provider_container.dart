import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

/// ProviderContainer to store the state of the providers during a unit test.
/// When using Flutter, the ProviderScope handles creating the ProviderContainer
/// for us under the hood. However, when using providers outside of Flutter
/// (i.e. in unit tests) we need to create this container ourselves.
ProviderContainer createTestProviderContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );

  addTearDown(container.dispose);

  return container;
}
