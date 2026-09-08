import 'package:video_server_api/video_server_api.dart';

bool isActiveAnalysis(AnalysisResponse? job) =>
    job?.status == AnalysisStatus.queued ||
    job?.status == AnalysisStatus.running ||
    job?.status == AnalysisStatus.retryWait;

AnalysisResponse? latestAnalysisJob(
  AnalysisResponse? current,
  AnalysisResponse? candidate,
) {
  if (current != null &&
      candidate != null &&
      current.id == candidate.id &&
      (candidate.runNo < current.runNo ||
          candidate.version < current.version)) {
    return current;
  }
  return candidate;
}
