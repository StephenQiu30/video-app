import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final refreshCredentialStoreProvider = Provider<RefreshCredentialStore>(
  (ref) => const SecureRefreshCredentialStore(),
);

abstract interface class RefreshCredentialStore {
  Future<String?> read();

  Future<void> write(String credential);

  Future<void> clear();
}

final class SecureRefreshCredentialStore implements RefreshCredentialStore {
  const SecureRefreshCredentialStore();

  static const _key = 'framegrab.native.refresh_credential';
  static const _storage = FlutterSecureStorage();

  @override
  Future<void> clear() => _storage.delete(key: _key);

  @override
  Future<String?> read() => _storage.read(key: _key);

  @override
  Future<void> write(String credential) {
    return _storage.write(key: _key, value: credential);
  }
}
