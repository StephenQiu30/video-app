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

  factory _$UpdateUserAccessRequest(
          [void Function(UpdateUserAccessRequestBuilder)? updates]) =>
      (UpdateUserAccessRequestBuilder()..update(updates))._build();

  _$UpdateUserAccessRequest._({this.role, this.isActive}) : super._();
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
        isActive == other.isActive;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'UpdateUserAccessRequest')
          ..add('role', role)
          ..add('isActive', isActive))
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

  UpdateUserAccessRequestBuilder() {
    UpdateUserAccessRequest._defaults(this);
  }

  UpdateUserAccessRequestBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _role = $v.role;
      _isActive = $v.isActive;
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
    final _$result = _$v ??
        _$UpdateUserAccessRequest._(
          role: role,
          isActive: isActive,
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
