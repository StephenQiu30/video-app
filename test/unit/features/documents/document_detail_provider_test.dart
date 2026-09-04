import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/documents/application/document_detail_provider.dart';
import 'package:framegrab/features/documents/data/document_repository.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/data_fakes.dart';

void main() {
  test(
    'polls an active document until parsing reaches a terminal state',
    () async {
      final repository = _SequencedDocumentRepository([
        documentDetailFixture(status: ImportStatus.verifying),
        documentDetailFixture(),
      ]);
      final container = ProviderContainer(
        overrides: [
          documentRepositoryProvider.overrideWithValue(repository),
          documentDetailPollingIntervalProvider.overrideWithValue(
            Duration.zero,
          ),
        ],
      );
      addTearDown(container.dispose);
      final statuses = <ImportStatus>[];
      final terminal = Completer<void>();
      final subscription = container.listen(
        documentDetailProvider('document-1'),
        (_, next) {
          final value = next.value;
          if (value == null) return;
          statuses.add(value.status);
          if (value.status == ImportStatus.ready && !terminal.isCompleted) {
            terminal.complete();
          }
        },
      );
      addTearDown(subscription.close);

      await terminal.future.timeout(const Duration(seconds: 1));
      await Future<void>.delayed(Duration.zero);

      expect(statuses, [ImportStatus.verifying, ImportStatus.ready]);
      expect(repository.detailCalls, 2);
    },
  );
}

final class _SequencedDocumentRepository implements DocumentRepository {
  _SequencedDocumentRepository(this.responses);

  final List<DocumentDetailResponse> responses;
  int detailCalls = 0;

  @override
  Future<DocumentDetailResponse> fetchDetail(String documentId) async {
    final index = detailCalls.clamp(0, responses.length - 1);
    detailCalls += 1;
    return responses[index];
  }

  @override
  Future<void> delete(String documentId) => throw UnimplementedError();

  @override
  Future<DocumentPageResponse> fetchFirstPage() => throw UnimplementedError();
}
