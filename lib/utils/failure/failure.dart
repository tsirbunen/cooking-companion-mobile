import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

const defaultMessage = 'Oops! Some error occurred...';

@freezed
class Failure with _$Failure implements Exception {
  const factory Failure(String message) = _Failure;
}
