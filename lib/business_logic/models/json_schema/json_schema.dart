import 'package:freezed_annotation/freezed_annotation.dart';

part 'json_schema.freezed.dart';
part 'json_schema.g.dart';

@freezed
class JsonSchema with _$JsonSchema {
  @JsonSerializable(explicitToJson: true)
  const factory JsonSchema({
    required String title,
    required String description,
    required String type,
    required List<String> required,
    required Map<String, dynamic> properties,
    Map<String, dynamic>? errorMessage,
  }) = _JsonSchema;

  factory JsonSchema.fromJson(Map<String, Object?> json) =>
      _$JsonSchemaFromJson(json);
}
