import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/download/application/download_intake_controller.dart';
import 'package:framegrab/features/download/data/download_intake_repository.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/intake_fakes.dart';

void main() {
  test('inspects a public URL and selects the first real format', () async {
    final repository = FakeDownloadIntakeRepository();
    final container = _container(repository);
    addTearDown(container.dispose);

    await container
        .read(downloadIntakeControllerProvider.notifier)
        .inspect('https://media.example/video');
    final state = container.read(downloadIntakeControllerProvider);

    expect(repository.publicUrls, ['https://media.example/video']);
    expect(state.inspection?.title, '真实解析视频');
    expect(state.selectedFormatId, state.inspection?.formats.first.id);
    expect(state.error, isNull);
  });

  test('discovers a WeChat article and inspects the selected item', () async {
    final repository = FakeDownloadIntakeRepository();
    final container = _container(repository);
    addTearDown(container.dispose);
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );

    await controller.inspect('https://mp.weixin.qq.com/s/article');
    expect(repository.discoveryUrls, ['https://mp.weixin.qq.com/s/article']);
    expect(
      container.read(downloadIntakeControllerProvider).discovery,
      isNotNull,
    );

    await controller.inspectItem('00000000-0000-0000-0000-000000000312');
    expect(repository.selectedItems, ['00000000-0000-0000-0000-000000000312']);
    expect(
      container.read(downloadIntakeControllerProvider).inspection,
      isNotNull,
    );
  });

  test('creates a download with the selected format', () async {
    final repository = FakeDownloadIntakeRepository();
    final container = _container(repository);
    addTearDown(container.dispose);
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );
    await controller.inspect('https://media.example/video');
    controller.selectFormat('00000000-0000-0000-0000-000000000303');

    final job = await controller.createDownload();

    expect(job?.status, DownloadStatus.queued);
    expect(repository.createdFormats, ['00000000-0000-0000-0000-000000000303']);
    expect(repository.idempotencyKeys.every((key) => key.isNotEmpty), isTrue);
  });

  test('never creates a task for a non-downloadable decision', () async {
    final repository = FakeDownloadIntakeRepository(
      inspection: inspectionFixture(decision: AccessDecision.blocked),
    );
    final container = _container(repository);
    addTearDown(container.dispose);
    final controller = container.read(
      downloadIntakeControllerProvider.notifier,
    );
    await controller.inspect('https://media.example/restricted');

    final job = await controller.createDownload();

    expect(job, isNull);
    expect(repository.createdFormats, isEmpty);
  });
}

ProviderContainer _container(DownloadIntakeRepository repository) =>
    ProviderContainer(
      overrides: [
        downloadIntakeRepositoryProvider.overrideWithValue(repository),
      ],
    );
