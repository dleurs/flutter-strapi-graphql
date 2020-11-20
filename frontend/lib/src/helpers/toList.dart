typedef Iterable<T> IterableCallback<T>();

List<T> toList<T>(IterableCallback<T> cb) {
  return List.unmodifiable(cb());
}
