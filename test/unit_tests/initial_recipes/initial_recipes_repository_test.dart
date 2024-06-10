import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile/core/api_service/api_client_provider.dart';
import 'package:mobile/features/recipes/application/initial_recipes_provider.dart';
import 'package:mobile/features/recipes/domain/models/recipe/recipe.dart';
import 'package:mobile/features/recipes/repository/graph_ql.dart';
import 'package:mobile/features/recipes/repository/repository_provider.dart';
import '../../test_utils/api_client/test_api_client.dart';
import '../../test_utils/listener/test_listener.dart';
import '../../test_utils/provider_container/test_provider_container.dart';
import '../../test_utils/data/initial_recipes_test_data.dart';

const queryResponseData = initialRecipesTestData;

void main() {
  group('INITIAL RECIPES -', () {
    group('REPOSITORY -', () {
      testWidgets('fetches recipes and converts them to model objects',
          (tester) async {
        final query = InitialRecipesQuery();
        final apiClient = getTestApiClient(
          query: query,
          responseData: queryResponseData,
        );
        final container = createTestProviderContainer(
          overrides: [apiClientProvider.overrideWithValue(apiClient)],
        );

        final response =
            await container.read(repositoryProvider).getInitialRecipes();
        final recipes = response.valueOrNull;

        expect(recipes!.length, queryResponseData[query.name]!.length);
        for (final recipe in recipes) {
          expect(recipe, isA<Recipe>());
        }
      });

      testWidgets('on api client exception returns a failure', (tester) async {
        final query = InitialRecipesQuery();
        final apiClient = getTestApiClient(query: query, isException: true);
        final container = createTestProviderContainer(
          overrides: [apiClientProvider.overrideWithValue(apiClient)],
        );

        final response =
            await container.read(repositoryProvider).getInitialRecipes();
        expect(response.isFailure, true);
      });
    });

    group('NOTIFIER -', () {
      testWidgets(
          'holds recipes as model objects in its state (aka "future") once built',
          (tester) async {
        final query = InitialRecipesQuery();
        final apiClient = getTestApiClient(
          query: query,
          responseData: queryResponseData,
        );
        final ProviderContainer container = createTestProviderContainer(
          overrides: [apiClientProvider.overrideWithValue(apiClient)],
        );

        // Note: We need to add a listener to keep the notifier provider alive
        // throughout the test.
        final listener = TestListener();
        container.listen(
          initialRecipesProvider.notifier,
          listener.call,
          fireImmediately: true,
        );

        final recipes = await container.read(initialRecipesProvider.future);

        expect(recipes!.length, queryResponseData[query.name]!.length);
        for (final recipe in recipes) {
          expect(recipe, isA<Recipe>());
        }
      });

      testWidgets('on api exception throws exception', (tester) async {
        final query = InitialRecipesQuery();
        final apiClient = getTestApiClient(
          query: query,
          isException: true,
        );
        final ProviderContainer container = createTestProviderContainer(
          overrides: [apiClientProvider.overrideWithValue(apiClient)],
        );

        // Note: We need to add a listener to keep the notifier provider alive
        // throughout the test.
        final listener = TestListener();
        container.listen(
          initialRecipesProvider.notifier,
          listener.call,
          fireImmediately: true,
        );
        expect(() async => await container.read(initialRecipesProvider.future),
            throwsException);
      });
    });
  });
}
