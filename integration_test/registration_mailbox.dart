import 'package:dio/dio.dart';

/// Only a separately configured local test SMTP inbox exposes captured codes.
/// The production API never has a code-reading endpoint.
Future<String> registrationCodeFromTestInbox(String email) async {
  const url = String.fromEnvironment('REGISTRATION_TEST_INBOX_URL');
  if (url.isEmpty) throw StateError('REGISTRATION_TEST_INBOX_URL is required');
  final client = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );
  try {
    final response = await client.get<Map<String, dynamic>>(
      url,
      queryParameters: {'email': email},
    );
    final code = response.data?['code'];
    if (code is! String || !RegExp(r'^[0-9]{6}$').hasMatch(code)) {
      throw StateError('No captured registration code');
    }
    return code;
  } finally {
    client.close();
  }
}
