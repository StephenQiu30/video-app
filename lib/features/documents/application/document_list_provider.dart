import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:framegrab/features/documents/data/document_repository.dart';
import 'package:framegrab/shared/presentation/list_query.dart';
import 'package:video_server_api/video_server_api.dart';

final documentListProvider = FutureProvider.autoDispose<DocumentPageResponse>(
  (ref) => ref
      .watch(documentRepositoryProvider)
      .fetchPage(page: ref.watch(documentListQueryProvider).page),
  retry: (_, _) => null,
);

final documentListQueryProvider =
    NotifierProvider.autoDispose<ListQueryController, ListQuery>(
      ListQueryController.new,
    );
