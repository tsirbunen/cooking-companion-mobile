## COOKING COMPANION (MOBILE)

Want to cook something **delicious**? Navigate to the **[COOKING COMPANION]()** !!!
COOKING COMPANION (mobile) is a Flutter GraphQL frontend app built with **[Flutter](https://flutter.dev)**.

For a desktop or tablet version of the app, please see the **[React project](https://github.com/tsirbunen/cookbook)**

### Code generation

To build the generated parts of immutable Freezed model classes, the go router routes and test mocks, use the build_runner command (where "--delete-conflicting-outputs" prevents the prompt asking what to do with conflicting pre-existing files):

`dart run build_runner build --delete-conflicting-outputs`

(You might need to run `flutter pub global activate build_runner` prior to the file generation.)

### Running tests

To run unit and widget tests

`flutter test`

or, for a more verbose output

`flutter test -r expanded`

In the tests as little as possible has been mocked (meaning that currently only the graphQL client has been replaced with a mock in the tests).

### Packages and technologies

- **IMMUTABLE MODELS:** For the immutable domain entity models the **[freezed](https://pub.dev/packages/freezed)** package was chosen. Freezed classes are annotated with **[freezed_annotation](https://pub.dev/packages/freezed_annotation)** and generated files built with the **[build_runner](https://pub.dev/packages/build_runner)** to produce \*.freezed.dart-files in the same folder as the original annotated class file. When a fromJson factory constructor is defined in a class with the @freezed-annotation, then code for (de)serialization of the freezed model class is generated (\*.g.dart). For this, also the **[json_serializable](https://pub.dev/packages/json_serializable)** with **[json_annotation](https://pub.dev/packages/json_annotation)** is needed.
- **ROUTING:** **[go_router](https://pub.dev/packages/go_router)** with **[type-safe routes](https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html)** and **[go_router_builder file generation](https://pub.dev/packages/go_router_builder)** were used.
- **GRAPHQL CLIENT:** For the GraphQL client, the more recent **[Ferry](https://ferrygraphql.com)** was first considered, but it seemed quite "code-generation-heavy" and is based on StreamBuilder and Built value which were not desired. So the "traditional" **[graphql](https://pub.dev/packages/graphql)** was chosen. The GraphQL client connects to the **/api/graphql** of **[the Cookbook companion Next.js web app](https://github.com/tsirbunen/cookbook/)**.
- **STATE MANAGEMENT:** I started off with the **[riverpod](https://riverpod.dev/docs/introduction/why_riverpod)** package (mainly out of curiosity), but soon ditched it in favor of the Bloc based approach and the **[flutter_bloc](https://pub.dev/packages/flutter_bloc)** package.
- **OBJECT COMPARISON:** **[equatable](https://pub.dev/packages/equatable/example)**
- **DEPENDENCY INJECTION:** **[get_it](https://pub.dev/packages/get_it)**
- **TEST MOCKING:** For test mocking, the **[mockito](https://pub.dev/packages/mockito)** package was selected.
- **BLOC TESTING:** To help in testing bloc functionality, the **[bloc_test](https://pub.dev/packages/bloc_test)** package was selected.
- **LOGGING:** For advanced logging, the **[Talker](https://pub.dev/packages/talker)** package was selected (along with **[talker_flutter](https://github.com/Frezyx/talker/tree/master/packages/talker_flutter)**). For logging GraphQL queries (with inspiration from **[http_interceptor](https://pub.dev/packages/http_interceptor)**), a custom "query interceptor" was created. The **Talker** was wrapped with a custom Logger to enable possible later switch to another logger and to customize the log.

### Deployment

Build the app with

`flutter build web`
`flutter build web --web-renderer html`

Drag the directory **/build/web/** to Netlify.

### Directory structure

The overall structure of the project files is presented in the diagram below:

```
lib/
  ├── core/
        ├── api_service/
        ├── app/
        └── router/
  ├── features/
          ├── users/
          └── recipes/
  ├── utils/
          ├── either/
          ├── graph_ql/
          └── failure/
  ├── test/
  ├── widgets/
  └── main.dart
```

The directory structure of an example feature is presented below:

```
some_feature/
      ├── application/
      ├── domain/
            ├── models/
            └── use_cases
      ├── presentation/
      └── repository/
            ├── api_query_handling/
            └── graph_ql
```
