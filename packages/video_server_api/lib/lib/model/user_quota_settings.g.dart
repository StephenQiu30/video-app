// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_quota_settings.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UserQuotaSettings extends UserQuotaSettings {
  @override
  final bool? exempt;
  @override
  final int? maxActivePerOwner;
  @override
  final int? dailyTasks;
  @override
  final int? dailyBytes;
  @override
  final int? storageBytes;
  @override
  final int? dailyAnalysisAttempts;

  factory _$UserQuotaSettings(
          [void Function(UserQuotaSettingsBuilder)? updates]) =>
      (UserQuotaSettingsBuilder()..update(updates))._build();

  _$UserQuotaSettings._(
      {this.exempt,
      this.maxActivePerOwner,
      this.dailyTasks,
      this.dailyBytes,
      this.storageBytes,
      this.dailyAnalysisAttempts})
      : super._();
  @override
  UserQuotaSettings rebuild(void Function(UserQuotaSettingsBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UserQuotaSettingsBuilder toBuilder() =>
      UserQuotaSettingsBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UserQuotaSettings &&
        exempt == other.exempt &&
        maxActivePerOwner == other.maxActivePerOwner &&
        dailyTasks == other.dailyTasks &&
        dailyBytes == other.dailyBytes &&
        storageBytes == other.storageBytes &&
        dailyAnalysisAttempts == other.dailyAnalysisAttempts;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, exempt.hashCode);
    _$hash = $jc(_$hash, maxActivePerOwner.hashCode);
    _$hash = $jc(_$hash, dailyTasks.hashCode);
    _$hash = $jc(_$hash, dailyBytes.hashCode);
    _$hash = $jc(_$hash, storageBytes.hashCode);
    _$hash = $jc(_$hash, dailyAnalysisAttempts.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UserQuotaSettings')
          ..add('exempt', exempt)
          ..add('maxActivePerOwner', maxActivePerOwner)
          ..add('dailyTasks', dailyTasks)
          ..add('dailyBytes', dailyBytes)
          ..add('storageBytes', storageBytes)
          ..add('dailyAnalysisAttempts', dailyAnalysisAttempts))
        .toString();
  }
}

class UserQuotaSettingsBuilder
    implements Builder<UserQuotaSettings, UserQuotaSettingsBuilder> {
  _$UserQuotaSettings? _$v;

  bool? _exempt;
  bool? get exempt => _$this._exempt;
  set exempt(bool? exempt) => _$this._exempt = exempt;

  int? _maxActivePerOwner;
  int? get maxActivePerOwner => _$this._maxActivePerOwner;
  set maxActivePerOwner(int? maxActivePerOwner) =>
      _$this._maxActivePerOwner = maxActivePerOwner;

  int? _dailyTasks;
  int? get dailyTasks => _$this._dailyTasks;
  set dailyTasks(int? dailyTasks) => _$this._dailyTasks = dailyTasks;

  int? _dailyBytes;
  int? get dailyBytes => _$this._dailyBytes;
  set dailyBytes(int? dailyBytes) => _$this._dailyBytes = dailyBytes;

  int? _storageBytes;
  int? get storageBytes => _$this._storageBytes;
  set storageBytes(int? storageBytes) => _$this._storageBytes = storageBytes;

  int? _dailyAnalysisAttempts;
  int? get dailyAnalysisAttempts => _$this._dailyAnalysisAttempts;
  set dailyAnalysisAttempts(int? dailyAnalysisAttempts) =>
      _$this._dailyAnalysisAttempts = dailyAnalysisAttempts;

  UserQuotaSettingsBuilder() {
    UserQuotaSettings._defaults(this);
  }

  UserQuotaSettingsBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _exempt = $v.exempt;
      _maxActivePerOwner = $v.maxActivePerOwner;
      _dailyTasks = $v.dailyTasks;
      _dailyBytes = $v.dailyBytes;
      _storageBytes = $v.storageBytes;
      _dailyAnalysisAttempts = $v.dailyAnalysisAttempts;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UserQuotaSettings other) {
    _$v = other as _$UserQuotaSettings;
  }

  @override
  void update(void Function(UserQuotaSettingsBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UserQuotaSettings build() => _build();

  _$UserQuotaSettings _build() {
    final _$result = _$v ??
        _$UserQuotaSettings._(
          exempt: exempt,
          maxActivePerOwner: maxActivePerOwner,
          dailyTasks: dailyTasks,
          dailyBytes: dailyBytes,
          storageBytes: storageBytes,
          dailyAnalysisAttempts: dailyAnalysisAttempts,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
