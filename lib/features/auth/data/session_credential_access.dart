import 'package:framegrab/features/auth/data/refresh_credential_store.dart';

/// Keeps credential writes and logout cleanup in invocation order.
final class SessionCredentialAccess {
  SessionCredentialAccess(this._store);

  final RefreshCredentialStore _store;
  Future<void> _pending = Future<void>.value();

  Future<T> run<T>(Future<T> Function(RefreshCredentialStore) operation) {
    final next = _pending.then((_) => operation(_store));
    _pending = next.then<void>((_) {}, onError: (Object _, StackTrace _) {});
    return next;
  }
}
