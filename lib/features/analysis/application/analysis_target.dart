import 'package:video_server_api/video_server_api.dart';

final class AnalysisTarget {
  const AnalysisTarget.video(this.id) : inputKind = AnalysisInputKind.video;

  const AnalysisTarget.screenplay(this.id)
    : inputKind = AnalysisInputKind.screenplay;

  final String id;
  final AnalysisInputKind inputKind;

  bool get isScreenplay => inputKind == AnalysisInputKind.screenplay;

  @override
  bool operator ==(Object other) =>
      other is AnalysisTarget && other.id == id && other.inputKind == inputKind;

  @override
  int get hashCode => Object.hash(id, inputKind);
}
