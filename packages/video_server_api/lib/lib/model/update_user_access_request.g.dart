// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_access_request.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$UpdateUserAccessRequest extends UpdateUserAccessRequest {
  @override
  final UserRole? role;
  @override
  final bool? isActive;
  @override
  final UserQuotaSettings? quota;

  factory _$UpdateUserAccessRequest(
          [void Function(UpdateUserAccessRequestBuilder)? updates]) =>
      (UpdateUserAccessRequestBuilder()..update(updates))._build();

  _$UpdateUserAccessRequest._({this.role, this.isActive, this.quota})
      : super._();
  @override
  UpdateUserAccessRequest rebuild(
          void Function(UpdateUserAccessRequestBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UpdateUserAccessRequestBuilder toBuilder() =>
      UpdateUserAccessRequestBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is UpdateUserAccessRequest &&
        role == other.role &&
        isActive == other.isActive &&
        quota == other.quota;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, quota.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateUserAccessRequest')
          ..add('role', role)
          ..add('isActive', isActive)
          ..add('quota', quota))
        .toString();
  }
}

class UpdateUserAccessRequestBuilder
    implements
        Builder<UpdateUserAccessRequest, UpdateUserAccessRequestBuilder> {
  _$UpdateUserAccessRequest? _$v;

  UserRole? _role;
  UserRole? get role => _$this._role;
  set role(UserRole? role) => _$this._role = role;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  UserQuotaSettingsBuilder? _quota;
  UserQuotaSettingsBuilder get quota =>
      _$this._quota ??= UserQuotaSettingsBuilder();
  set quota(UserQuotaSettingsBuilder? quota) => _$this._quota = quota;

  UpdateUserAccessRequestBuilder() {
    UpdateUserAccessRequest._defaults(this);
  }

  UpdateUserAccessRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _role = $v.role;
      _isActive = $v.isActive;
      _quota = $v.quota?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(UpdateUserAccessRequest other) {
    _$v = other as _$UpdateUserAccessRequest;
  }

  @override
  void update(void Function(UpdateUserAccessRequestBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  UpdateUserAccessRequest build() => _build();

  _$UpdateUserAccessRequest _build() {
    _$UpdateUserAccessRequest _$result;
    try {
      _$result = _$v ??
          _$UpdateUserAccessRequest._(
            role: role,
            isActive: isActive,
            quota: _quota?.build(),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'quota';
        _quota?.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'UpdateUserAccessRequest', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
