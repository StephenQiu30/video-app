import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:framegrab/features/media/presentation/download_video_panel.dart';
import 'package:video_server_api/video_server_api.dart';

import '../../../support/data_fakes.dart';

void main() {
  test('allows native iOS playback for MP4 H264', () {
    expect(
      supportsNativePlayback(
        downloadDetailFixture(),
        platform: TargetPlatform.iOS,
      ),
      isTrue,
    );
  });

  test('gates WebM AV1 on iOS but keeps original-file access available', () {
    final webm = downloadDetailFixture().rebuild(
      (builder) => builder.format.update(
        (format) => format
          ..containerPreference = ContainerPreference.webm
          ..videoCodecFamily = VideoCodecFamily.av1,
      ),
    );

    expect(supportsNativePlayback(webm, platform: TargetPlatform.iOS), isFalse);
    expect(
      supportsNativePlayback(webm, platform: TargetPlatform.android),
      isTrue,
    );
  });
}
