enum DataRequestFailureKind {
  unauthenticated,
  rateLimited,
  unavailable,
  invalidResponse,
  unknown,
}

final class DataRequestFailure implements Exception {
  const DataRequestFailure(this.kind);

  final DataRequestFailureKind kind;
}
