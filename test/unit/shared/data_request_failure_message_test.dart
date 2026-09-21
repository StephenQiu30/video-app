import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/core/network/data_request_failure.dart';
import 'package:framegrab/l10n/app_localizations.dart';
import 'package:framegrab/shared/presentation/data_request_failure_message.dart';

void main() {
  final localizations = lookupAppLocalizations(const Locale('zh'));

  test('does not describe an invalid response as a network failure', () {
    final message = dataRequestFailureMessage(
      localizations,
      const DataRequestFailure(DataRequestFailureKind.invalidResponse),
    );

    expect(message, contains('App 版本'));
    expect(message, isNot(contains('网络')));
  });

  test('uses a safe server message for an otherwise unknown failure', () {
    final message = dataRequestFailureMessage(
      localizations,
      const DataRequestFailure(
        DataRequestFailureKind.unknown,
        detail: 'The task is still active.',
      ),
    );

    expect(message, 'The task is still active.');
  });
}
