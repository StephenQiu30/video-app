enum DataRequestFailureKind {
  unauthenticated,
  forbidden,
  rateLimited,
  unavailable,
  invalidResponse,
  unknown,
}

final class DataRequestFailure implements Exception {
  const DataRequestFailure(
    this.kind, {
    this.code,
    this.detail,
    this.statusCode,
  });

  final DataRequestFailureKind kind;
  final String? code;
  final String? detail;
  final int? statusCode;
}
