## COOKING COMPANION (MOBILE)

Want to cook something **delicious**? Navigate to the **[COOKING COMPANION]()** !!!
COOKING COMPANION (mobile) is a Flutter GraphQL frontend app built with **[Flutter](https://flutter.dev)**.

For a desktop or tablet version of the app, please see the **[React project](https://github.com/tsirbunen/cookbook)**

### Code generation

To build the generated parts of immutable Freezed model classes and the go router routes, use the build_runner command (where "--delete-conflicting-outputs" prevents the prompt asking what to do with conflicting pre-existing files):

`dart run build_runner build --delete-conflicting-outputs`

(You might need to run `flutter pub global activate build_runner` prior to the file generation.)

### Packages and technologies

- **IMMUTABLE MODELS:** For the immutable domain entity models the **[freezed](https://pub.dev/packages/freezed)** package was chosen. Freezed classes are annotated with **[freezed_annotation](https://pub.dev/packages/freezed_annotation)** and generated files built with the **[build_runner](https://pub.dev/packages/build_runner)** to produce \*.freezed.dart-files in the same folder as the original annotated class file. When a fromJson factory constructor is defined in a class with the @freezed-annotation, then code for (de)serialization of the freezed model class is generated (\*.g.dart). For this, also the **[json_serializable](https://pub.dev/packages/json_serializable)** with **[json_annotation](https://pub.dev/packages/json_annotation)** is needed.
- **ROUTING:** **[go_router](https://pub.dev/packages/go_router)** with **[type-safe routes](https://pub.dev/documentation/go_router/latest/topics/Type-safe%20routes-topic.html)** and **[go_router_builder file generation](https://pub.dev/packages/go_router_builder)** were used.
- **GRAPHQL CLIENT:** For the GraphQL client, the more recent **[Ferry](https://ferrygraphql.com)** was first considered, but it seemed quite "code-generation-heavy" and is based on StreamBuilder and Built value which were not desired. So the "traditional" **[graphql](https://pub.dev/packages/graphql)** was chosen.
