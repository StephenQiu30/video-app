import 'package:framegrab/features/analysis/data/analysis_repository.dart';
import 'package:video_server_api/video_server_api.dart';

final class FakeAnalysisRepository implements AnalysisRepository {
  FakeAnalysisRepository({
    this.createError,
    this.createResult,
    this.error,
    this.latest,
    List<AnalysisSkillResponse>? skills,
  }) : skills = skills ?? [analysisSkillFixture()];

  AnalysisResponse? createResult;
  Object? createError;
  Object? error;
  AnalysisResponse? latest;
  List<AnalysisSkillResponse> skills;
  final List<AnalysisResponse> fetchResults = [];
  final List<String> createKeys = [];
  final List<String> retryKeys = [];
  int cancelCalls = 0;
  int deleteCalls = 0;
  int fetchCalls = 0;
  int latestCalls = 0;

  @override
  Future<AnalysisResponse> cancel(String analysisId) async {
    cancelCalls += 1;
    if (error case final failure?) throw failure;
    return analysisJobFixture(status: AnalysisStatus.cancelled);
  }

  @override
  Future<AnalysisResponse> create({
    required String customPrompt,
    required String downloadId,
    required String idempotencyKey,
    required String outputLanguage,
    required String skillId,
  }) async {
    createKeys.add(idempotencyKey);
    if (createError case final failure?) throw failure;
    if (error case final failure?) throw failure;
    return createResult ?? analysisJobFixture(status: AnalysisStatus.queued);
  }

  @override
  Future<void> delete(String analysisId) async {
    deleteCalls += 1;
    if (error case final failure?) throw failure;
    latest = null;
  }

  @override
  Future<AnalysisResponse> fetch(String analysisId) async {
    fetchCalls += 1;
    if (error case final failure?) throw failure;
    if (fetchResults.isNotEmpty) return fetchResults.removeAt(0);
    return latest ?? analysisJobFixture(status: AnalysisStatus.succeeded);
  }

  @override
  Future<AnalysisResponse?> fetchLatest(String downloadId) async {
    latestCalls += 1;
    if (error case final failure?) throw failure;
    return latest;
  }

  @override
  Future<List<AnalysisSkillResponse>> fetchVideoSkills() async {
    if (error case final failure?) throw failure;
    return skills;
  }

  @override
  Future<AnalysisResponse> retry({
    required String analysisId,
    required String idempotencyKey,
  }) async {
    retryKeys.add(idempotencyKey);
    if (error case final failure?) throw failure;
    return analysisJobFixture(status: AnalysisStatus.queued, runNo: 2);
  }
}

AnalysisSkillResponse analysisSkillFixture() => AnalysisSkillResponse(
  (builder) => builder
    ..id = 'director-breakdown'
    ..displayName = '导演拉片'
    ..description = '复盘构图、镜头动机与叙事节拍。'
    ..defaultPrompt = '重点分析镜头调度与叙事节奏。'
    ..inputKinds.replace([AnalysisInputKind.video])
    ..resultContract = AnalysisResultContract.videoVisualAnalysis,
);

AnalysisResponse analysisJobFixture({
  int runNo = 1,
  AnalysisStatus status = AnalysisStatus.succeeded,
  String resultKind = 'video_visual_analysis',
}) {
  final active =
      status == AnalysisStatus.queued || status == AnalysisStatus.running;
  final succeeded = status == AnalysisStatus.succeeded;
  final json = <String, Object?>{
    'id': '00000000-0000-0000-0000-000000000401',
    'run_id': '00000000-0000-0000-0000-000000000402',
    'run_no': runNo,
    'run_trigger': runNo == 1 ? 'create' : 'retry',
    'version': runNo,
    'skill_id': resultKind == 'video_article'
        ? 'video-to-article'
        : 'director-breakdown',
    'output_language': 'zh-CN',
    'input_kind': 'video',
    'result_contract': resultKind == 'video_article'
        ? 'video-article'
        : 'video-visual-analysis',
    'status': status.name == 'retryWait' ? 'retry_wait' : status.name,
    'stage': active ? 'analyzing' : null,
    'progress': succeeded ? 100 : (active ? 42 : 0),
    'attempt': active ? 1 : 0,
    'error_code': status == AnalysisStatus.failed
        ? 'analysis_cli_failed'
        : null,
    'created_at': '2026-08-31T10:00:00Z',
    'updated_at': '2026-08-31T10:02:00Z',
    'finished_at': succeeded ? '2026-08-31T10:02:00Z' : null,
    'result': succeeded
        ? (resultKind == 'video_article' ? _articleResult : _visualResult)
        : null,
    'report_markdown': succeeded ? '# 已验证分析报告' : null,
    'current_report_id': succeeded
        ? '00000000-0000-0000-0000-000000000403'
        : null,
    'report': null,
  };
  return standardSerializers.deserializeWith(
    AnalysisResponse.serializer,
    json,
  )!;
}

const _visualResult = <String, Object?>{
  'kind': 'video_visual_analysis',
  'language': 'zh-CN',
  'title': '舞台表演视觉分析',
  'summary': {
    'text': '镜头围绕主体动作与舞台调度形成连续节奏。',
    'evidence_shot_ids': ['shot-1'],
  },
  'media': {'duration_ms': 124000, 'container': 'mp4', 'size_bytes': 2048},
  'shot_count': 1,
  'shots': [
    {
      'id': 'shot-1',
      'index': 1,
      'start_ms': 0,
      'end_ms': 5000,
      'representative_frame_ms': 2500,
      'description': '主体从舞台中央进入近景。',
      'transition_in': 'cut',
      'shot_size': 'medium',
      'camera_motion': 'push_in',
      'narrative_function': '建立主体',
      'highlight_score': 88,
      'visual_tags': ['舞台', '人物'],
      'asset_ids': ['asset-1'],
    },
  ],
  'scenes': [
    {
      'id': 'scene-1',
      'index': 1,
      'title': '舞台开场',
      'start_ms': 0,
      'end_ms': 5000,
      'location': '主舞台',
      'description': '主体完成开场动作。',
      'narrative_function': '建立表演氛围',
      'visual_rules': ['保持主体居中'],
      'continuity_risks': <String>[],
      'evidence_shot_ids': ['shot-1'],
    },
  ],
  'highlights': [
    {
      'id': 'highlight-1',
      'title': '开场定格',
      'description': '动作与灯光同步完成。',
      'score': 92,
      'reason': '视觉显著且节奏明确。',
      'start_ms': 1000,
      'end_ms': 3000,
      'evidence_shot_ids': ['shot-1'],
    },
  ],
  'assets': [
    {
      'id': 'asset-1',
      'type': 'person',
      'label': '主舞者',
      'description': '黑色舞台服装的表演主体。',
      'first_seen_ms': 0,
      'evidence_shot_ids': ['shot-1'],
    },
  ],
  'production_advice': {
    'summary': '保留开场推进镜头作为节奏锚点。',
    'priority_shot_ids': ['shot-1'],
    'recommended_extensions': ['补充舞台全景'],
  },
};

const _articleResult = <String, Object?>{
  'kind': 'video_article',
  'language': 'zh-CN',
  'title': '舞台表演如何建立开场吸引力',
  'lead': '这段表演通过主体动作与灯光同步快速建立注意力。',
  'sections': [
    {
      'id': 'section-1',
      'title': '从定格动作开始',
      'body': '开场镜头把人物和舞台空间同时交代清楚。',
      'evidence': [
        {'start_ms': 0, 'end_ms': 5000, 'note': '开场主体动作'},
      ],
    },
  ],
  'key_points': ['动作先于信息', '灯光强化视觉中心'],
  'closing': '稳定的视觉锚点让后续节奏更容易建立。',
  'limitations': ['仅基于可见画面分析'],
  'media': {'duration_ms': 124000, 'container': 'mp4', 'size_bytes': 2048},
};
