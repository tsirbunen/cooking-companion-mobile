/// Custom minimal implementation for an Either class. This was created
/// because the latest version (2.0.0-dev.3) of the "dartfp" package
/// does not have the "fold" or "match" method it used to.
class Either<F, V> {
  final F? failure;
  final V? value;

  Either({this.failure, this.value});
  factory Either.value(V value) => Either(value: value);
  factory Either.failure(F failure) => Either(failure: failure);

  // Note: Give the parameters in "reverse order" (i.e. onValue first) so that
  // when using the function, the main activity can be dealt first (and the
  // error handling does not seem more important).
  // The return type T for both cases could be an Either (i.e. passing a
  // failure on but modifying the value) or an AsyncValue (error or data).
  T match<T>(
    T Function(V?) onValue,
    T Function(F) onFailure,
  ) {
    if (failure != null) {
      return onFailure(failure as F);
    } else {
      return onValue(value);
    }
  }

  bool get isFailure => failure != null;
  bool get isValue => !isFailure;

  F? get failureOrNull => isFailure ? failure : null;
  V? get valueOrNull => isValue ? value : null;
}
