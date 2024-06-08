/// A listener that can be used when listening to providers to keep them alive.
class TestListener<T> {
  T call(T? previous, T next) => next;
}
