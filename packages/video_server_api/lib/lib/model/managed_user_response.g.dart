// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'managed_user_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$ManagedUserResponse extends ManagedUserResponse {
  @override
  final String id;
  @override
  final String username;
  @override
  final String email;
  @override
  final UserRole role;
  @override
  final bool isActive;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  factory _$ManagedUserResponse(
          [void Function(ManagedUserResponseBuilder)? updates]) =>
      (ManagedUserResponseBuilder()..update(updates))._build();

  _$ManagedUserResponse._(
      {required this.id,
      required this.username,
      required this.email,
      required this.role,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt})
      : super._();
  @override
  ManagedUserResponse rebuild(
          void Function(ManagedUserResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ManagedUserResponseBuilder toBuilder() =>
      ManagedUserResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ManagedUserResponse &&
        id == other.id &&
        username == other.username &&
        email == other.email &&
        role == other.role &&
        isActive == other.isActive &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, username.hashCode);
    _$hash = $jc(_$hash, email.hashCode);
    _$hash = $jc(_$hash, role.hashCode);
    _$hash = $jc(_$hash, isActive.hashCode);
    _$hash = $jc(_$hash, createdAt.hashCode);
    _$hash = $jc(_$hash, updatedAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ManagedUserResponse')
          ..add('id', id)
          ..add('username', username)
          ..add('email', email)
          ..add('role', role)
          ..add('isActive', isActive)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class ManagedUserResponseBuilder
    implements Builder<ManagedUserResponse, ManagedUserResponseBuilder> {
  _$ManagedUserResponse? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  UserRole? _role;
  UserRole? get role => _$this._role;
  set role(UserRole? role) => _$this._role = role;

  bool? _isActive;
  bool? get isActive => _$this._isActive;
  set isActive(bool? isActive) => _$this._isActive = isActive;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DateTime? _updatedAt;
  DateTime? get updatedAt => _$this._updatedAt;
  set updatedAt(DateTime? updatedAt) => _$this._updatedAt = updatedAt;

  ManagedUserResponseBuilder() {
    ManagedUserResponse._defaults(this);
  }

  ManagedUserResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _username = $v.username;
      _email = $v.email;
      _role = $v.role;
      _isActive = $v.isActive;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ManagedUserResponse other) {
    _$v = other as _$ManagedUserResponse;
  }

  @override
  void update(void Function(ManagedUserResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ManagedUserResponse build() => _build();

  _$ManagedUserResponse _build() {
    final _$result = _$v ??
        _$ManagedUserResponse._(
          id: BuiltValueNullFieldError.checkNotNull(
              id, r'ManagedUserResponse', 'id'),
          username: BuiltValueNullFieldError.checkNotNull(
              username, r'ManagedUserResponse', 'username'),
          email: BuiltValueNullFieldError.checkNotNull(
              email, r'ManagedUserResponse', 'email'),
          role: BuiltValueNullFieldError.checkNotNull(
              role, r'ManagedUserResponse', 'role'),
          isActive: BuiltValueNullFieldError.checkNotNull(
              isActive, r'ManagedUserResponse', 'isActive'),
          createdAt: BuiltValueNullFieldError.checkNotNull(
              createdAt, r'ManagedUserResponse', 'createdAt'),
          updatedAt: BuiltValueNullFieldError.checkNotNull(
              updatedAt, r'ManagedUserResponse', 'updatedAt'),
        );
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
