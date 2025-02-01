## COOKING COMPANION (MOBILE)

Want to cook something **delicious**? Navigate to the **[COOKING COMPANION]()** !!! (not publicly available as yet)
COOKING COMPANION (mobile) is a Flutter GraphQL frontend app built with **[Flutter](https://flutter.dev)**.

For a desktop or tablet version of the app, please see the **[React project](https://github.com/tsirbunen/cookbook)**

### Code generation

To build the generated parts of immutable Freezed model classes, the go router routes, and test mocks, use the build_runner command (where "--delete-conflicting-outputs" prevents the prompt asking what to do with conflicting pre-existing files):

`dart run build_runner build --delete-conflicting-outputs`

(You might need to run `flutter pub global activate build_runner` prior to the file generation.)

### Running tests

To run unit and widget tests

`flutter test`

or, for a more verbose output

`flutter test -r expanded`

**Note that error logs are expected in the test output logs** (as also api server error handling is tested)! In the tests as little as possible has been mocked (meaning that currently only the graphQL client that is used by the api service has been replaced with mock implementations in the tests).

### Packages and technologies

- **IMMUTABLE MODELS:** For the immutable domain entity models the **[freezed](https://pub.dev/packages/freezed)** package was chosen. Freezed classes are annotated with **[freezed_annotation](https://pub.dev/packages/freezed_annotation)** and generated files built with the **[build_runner](https://pub.dev/packages/build_runner)** to produce \*.freezed.dart-files in the same folder as the original annotated class file. When a fromJson factory constructor is defined in a class with the @freezed-annotation, then code for (de)serialization of the freezed model class is generated (\*.g.dart). For this, also the **[json_serializable](https://pub.dev/packages/json_serializable)** with **[json_annotation](https://pub.dev/packages/json_annotation)** is needed.
- **ROUTING:** **[go_router](https://pub.dev/packages/go_router)** with **[type-safe routes](https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html)** and **[go_router_builder file generation](https://pub.dev/packages/go_router_builder)** were used.
- **GRAPHQL CLIENT:** For the GraphQL client, the more recent **[Ferry](https://ferrygraphql.com)** was first considered, but it seemed quite "code-generation-heavy" and is based on StreamBuilder and Built value which were not desired. So the "traditional" **[graphql](https://pub.dev/packages/graphql)** package was chosen. The GraphQL client connects to the **/api/graphql** of **[the Cookbook companion Next.js web app](https://github.com/tsirbunen/cookbook/)**.
- **STATE MANAGEMENT:** The project was started off with the **[riverpod](https://riverpod.dev/docs/introduction/why_riverpod)** package (mainly out of curiosity), but that was soon ditched in favor of the Bloc based approach and the **[flutter_bloc](https://pub.dev/packages/flutter_bloc)** package.
- **OBJECT COMPARISON:** To help comparing bloc states the **[equatable](https://pub.dev/packages/equatable/example)** package was selected.
- **DEPENDENCY INJECTION:** **[get_it](https://pub.dev/packages/get_it)**
- **TEST MOCKING:** For test mocking, the **[mockito](https://pub.dev/packages/mockito)** package was selected.
- **BLOC TESTING:** To help in testing bloc functionality, the **[bloc_test](https://pub.dev/packages/bloc_test)** package was used.
- **LOGGING:** For advanced logging, the **[Talker](https://pub.dev/packages/talker)** package was selected (along with **[talker_flutter](https://github.com/Frezyx/talker/tree/master/packages/talker_flutter)**). For logging GraphQL queries (with inspiration from **[http_interceptor](https://pub.dev/packages/http_interceptor)**), a custom "query interceptor" was implemented. The **Talker** was wrapped with a custom Logger to enable possible later switch to another logger and to customize the log.

### Deployment

Build the app with

`flutter build web`
`flutter build web --web-renderer html`

Drag the directory **/build/web/** to Netlify.

### Directory structure

The overall structure of the project is presented below:

```
lib/
  ├── app_services/
        ├── api_service/
        ├── app/
        ├── blocs/
        ├── router/
        ├── logger/
        └── theme/
  ├── business_logic/
          ├── all_recipes_logic/
          ├── cook_logic/
          ├── search_logic/
          ├── wizard_logic/
          └── models/
  ├── presentation/
          ├── pages/
          └── widgets/
  ├── repositories_and_data/
          ├── graph_ql/
          ├── models/
          └── repositories/
  ├── test/
  └── main.dart
```

An example of a business logic directory is presented below:

```
cook_logic/
      ├── cook_bloc.dart
      ├── cook_event.dart
      ├── cook_state.dart
      └── utils.dart
```

### Coding conventions

Here are some conventions used when developing the app:

- To understand what a widget does, I often need to see the build method. If the build method is placed at the end of the file (as seems to be the default), then I need to scroll to the end of the file to find it. However, if the build method is placed at the top of the Widget file instead, then there is no need to scroll. Furthermore, if the widget returned by the build method is composed of other, smaller widgets with descriptive names, then there might be no need to look further. Therefore, in this codebase, **each widget is placed in a file of its own own, the build method of each widget is placed at the top of the file containing it, and the build method uses other, smaller widgets with descriptive names**. All other methods are placed after the build method and the styling is placed at the very end where possible.
