/// Custom implementation for an Either class. This was created
/// because the latest version (2.0.0-dev.3) of the "dartfp" package
/// does not have the "fold" or "match" method it used to.
class Either<L, R> {
  final L? left;
  final R? right;

  Either({this.left, this.right});

  // Note: Give the parameters in "reverse order" (i.e. onRight first) so that
  // when using the function, the main activity can be dealt first (and the
  // error handling does not seem more important).
  match(
    Function(R) onRight,
    Function(L) onLeft,
  ) {
    if (left != null) {
      return onLeft(left as L);
    } else {
      return onRight(right as R);
    }
  }
}
