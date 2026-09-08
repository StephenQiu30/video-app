import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/auth/application/auth_session_controller.dart';
import 'package:framegrab/features/auth/data/native_auth_gateway.dart';
import 'package:framegrab/features/auth/data/refresh_credential_store.dart';
import 'package:framegrab/features/upload/application/content_upload_controller.dart';
import 'package:framegrab/features/upload/data/content_upload_repository.dart';
import 'package:framegrab/features/upload/data/local_content_picker.dart';
import 'package:framegrab/features/upload/domain/content_upload.dart';

import '../../../support/auth_fakes.dart';
import '../../../support/upload_fakes.dart';
import '../../../support/upload_race_fakes.dart';

void main() {
  test(
    'starting twice while busy creates one upload and accepts its result',
    () async {
      final repository = DeferredContentUploadRepository();
      final container = _container(repository);
      addTearDown(container.dispose);
      final controller = container.read(
        contentUploadControllerProvider.notifier,
      );
      final first = controller.start(ContentUploadKind.video);
      await controller.start(ContentUploadKind.video);
      await Future<void>.delayed(Duration.zero);
      expect(repository.operations, hasLength(1));
      repository.operations.single.succeed();
      await first;
      expect(
        container.read(contentUploadControllerProvider).phase,
        ContentUploadPhase.succeeded,
      );
    },
  );

  test(
    'cancel during picking prevents a late file from creating an upload',
    () async {
      final picker = DeferredContentPicker();
      final repository = DeferredContentUploadRepository();
      final container = _container(repository, picker: picker);
      addTearDown(container.dispose);
      final controller = container.read(
        contentUploadControllerProvider.notifier,
      );
      final pending = controller.start(ContentUploadKind.video);
      controller.cancel();
      picker.result.complete(uploadTestFile);
      await pending;
      expect(repository.operations, isEmpty);
      expect(
        container.read(contentUploadControllerProvider).phase,
        ContentUploadPhase.idle,
      );
    },
  );

  test(
    'cancel ignores late progress, phases and successful completion',
    () async {
      final repository = DeferredContentUploadRepository();
      final container = _container(repository);
      addTearDown(container.dispose);
      final controller = container.read(
        contentUploadControllerProvider.notifier,
      );
      final pending = controller.start(ContentUploadKind.video);
      await Future<void>.delayed(Duration.zero);
      final old = repository.operations.single;
      controller.cancel();
      expect(old.token.isCancelled, isTrue);
      old.onPhase(ContentUploadPhase.completing);
      old.onProgress(100);
      old.succeed();
      await pending;
      final state = container.read(contentUploadControllerProvider);
      expect(state.phase, ContentUploadPhase.idle);
      expect(state.result, isNull);
      expect(state.busy, isFalse);
    },
  );

  test(
    'a cancelled operation cannot clear or overwrite its replacement',
    () async {
      final repository = DeferredContentUploadRepository();
      final container = _container(repository);
      addTearDown(container.dispose);
      final controller = container.read(
        contentUploadControllerProvider.notifier,
      );
      final first = controller.start(ContentUploadKind.video);
      await Future<void>.delayed(Duration.zero);
      controller.cancel();
      final second = controller.start(ContentUploadKind.video);
      await Future<void>.delayed(Duration.zero);
      repository.operations.first.result.completeError(
        StateError('late failure'),
      );
      await first;
      expect(
        container.read(contentUploadControllerProvider).phase,
        ContentUploadPhase.uploading,
      );
      controller.cancel();
      expect(repository.operations.last.token.isCancelled, isTrue);
      repository.operations.last.succeed();
      await second;
      expect(container.read(contentUploadControllerProvider).result, isNull);
    },
  );

  test('a session change discards a pending picker result', () async {
    final picker = DeferredContentPicker();
    final repository = DeferredContentUploadRepository();
    final container = _container(repository, picker: picker);
    addTearDown(container.dispose);
    final auth = container.read(authSessionProvider.notifier);
    await auth.restore();
    final controller = container.read(contentUploadControllerProvider.notifier);
    final pending = controller.start(ContentUploadKind.video);
    await auth.logout();
    await auth.login(email: 'next@example.com', password: 'synthetic');
    picker.result.complete(uploadTestFile);
    await pending;
    expect(repository.operations, isEmpty);
    expect(
      container.read(contentUploadControllerProvider).phase,
      ContentUploadPhase.idle,
    );
  });

  test(
    'logout cancels transport and ignores callbacks from the previous account',
    () async {
      final repository = DeferredContentUploadRepository();
      final container = _container(repository);
      addTearDown(container.dispose);
      final auth = container.read(authSessionProvider.notifier);
      await auth.restore();
      final controller = container.read(
        contentUploadControllerProvider.notifier,
      );
      final pending = controller.start(ContentUploadKind.video);
      await Future<void>.delayed(Duration.zero);
      final old = repository.operations.single;
      await auth.logout();
      expect(
        container.read(contentUploadControllerProvider).phase,
        ContentUploadPhase.idle,
      );
      expect(old.token.isCancelled, isTrue);
      old.onPhase(ContentUploadPhase.completing);
      old.succeed();
      await pending;
      expect(container.read(contentUploadControllerProvider).result, isNull);
    },
  );

  test(
    'provider disposal cancels the upload without late state writes',
    () async {
      final repository = DeferredContentUploadRepository();
      final container = _container(repository);
      final controller = container.read(
        contentUploadControllerProvider.notifier,
      );
      final pending = controller.start(ContentUploadKind.video);
      await Future<void>.delayed(Duration.zero);
      final old = repository.operations.single;
      container.dispose();
      expect(old.token.isCancelled, isTrue);
      old.onProgress(100);
      old.succeed();
      await pending;
    },
  );
}

ProviderContainer _container(
  DeferredContentUploadRepository repository, {
  LocalContentPicker? picker,
}) => ProviderContainer(
  overrides: [
    nativeAuthGatewayProvider.overrideWithValue(FakeAuthGateway()),
    refreshCredentialStoreProvider.overrideWithValue(
      MemoryCredentialStore('refresh-test'),
    ),
    contentUploadRepositoryProvider.overrideWithValue(repository),
    localContentPickerProvider.overrideWithValue(
      picker ?? FakeLocalContentPicker(file: uploadTestFile),
    ),
  ],
);
