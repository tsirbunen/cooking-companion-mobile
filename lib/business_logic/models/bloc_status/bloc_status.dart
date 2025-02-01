enum Status {
  error,
  dirty,
  loading,
  ok,
  submitting,
  success,
  // FIXME: Get rid of these
  recipeCreated,
  recipePatched,
}

class BlocStatus {
  final Status status;
  final String? message;

  const BlocStatus(this.status, {this.message});
}
