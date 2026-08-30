// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'native_session_response.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

const NativeSessionResponseTokenTypeEnum
    _$nativeSessionResponseTokenTypeEnum_bearer =
    const NativeSessionResponseTokenTypeEnum._('bearer');
const NativeSessionResponseTokenTypeEnum
    _$nativeSessionResponseTokenTypeEnum_unknownDefaultOpenApi =
    const NativeSessionResponseTokenTypeEnum._('unknownDefaultOpenApi');

NativeSessionResponseTokenTypeEnum _$nativeSessionResponseTokenTypeEnumValueOf(
    String name) {
  switch (name) {
    case 'bearer':
      return _$nativeSessionResponseTokenTypeEnum_bearer;
    case 'unknownDefaultOpenApi':
      return _$nativeSessionResponseTokenTypeEnum_unknownDefaultOpenApi;
    default:
      return _$nativeSessionResponseTokenTypeEnum_unknownDefaultOpenApi;
  }
}

final BuiltSet<NativeSessionResponseTokenTypeEnum>
    _$nativeSessionResponseTokenTypeEnumValues = BuiltSet<
        NativeSessionResponseTokenTypeEnum>(const <NativeSessionResponseTokenTypeEnum>[
  _$nativeSessionResponseTokenTypeEnum_bearer,
  _$nativeSessionResponseTokenTypeEnum_unknownDefaultOpenApi,
]);

Serializer<NativeSessionResponseTokenTypeEnum>
    _$nativeSessionResponseTokenTypeEnumSerializer =
    _$NativeSessionResponseTokenTypeEnumSerializer();

class _$NativeSessionResponseTokenTypeEnumSerializer
    implements PrimitiveSerializer<NativeSessionResponseTokenTypeEnum> {
  static const Map<String, Object> _toWire = const <String, Object>{
    'bearer': 'Bearer',
    'unknownDefaultOpenApi': 'unknown_default_open_api',
  };
  static const Map<Object, String> _fromWire = const <Object, String>{
    'Bearer': 'bearer',
    'unknown_default_open_api': 'unknownDefaultOpenApi',
  };

  @override
  final Iterable<Type> types = const <Type>[NativeSessionResponseTokenTypeEnum];
  @override
  final String wireName = 'NativeSessionResponseTokenTypeEnum';

  @override
  Object serialize(
          Serializers serializers, NativeSessionResponseTokenTypeEnum object,
          {FullType specifiedType = FullType.unspecified}) =>
      _toWire[object.name] ?? object.name;

  @override
  NativeSessionResponseTokenTypeEnum deserialize(
          Serializers serializers, Object serialized,
          {FullType specifiedType = FullType.unspecified}) =>
      NativeSessionResponseTokenTypeEnum.valueOf(
          _fromWire[serialized] ?? (serialized is String ? serialized : ''));
}

class _$NativeSessionResponse extends NativeSessionResponse {
  @override
  final UserResponse user;
  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final NativeSessionResponseTokenTypeEnum tokenType;
  @override
  final DateTime accessExpiresAt;
  @override
  final DateTime refreshExpiresAt;

  factory _$NativeSessionResponse(
          [void Function(NativeSessionResponseBuilder)? updates]) =>
      (NativeSessionResponseBuilder()..update(updates))._build();

  _$NativeSessionResponse._(
      {required this.user,
      required this.accessToken,
      required this.refreshToken,
      required this.tokenType,
      required this.accessExpiresAt,
      required this.refreshExpiresAt})
      : super._();
  @override
  NativeSessionResponse rebuild(
          void Function(NativeSessionResponseBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NativeSessionResponseBuilder toBuilder() =>
      NativeSessionResponseBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NativeSessionResponse &&
        user == other.user &&
        accessToken == other.accessToken &&
        refreshToken == other.refreshToken &&
        tokenType == other.tokenType &&
        accessExpiresAt == other.accessExpiresAt &&
        refreshExpiresAt == other.refreshExpiresAt;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, user.hashCode);
    _$hash = $jc(_$hash, accessToken.hashCode);
    _$hash = $jc(_$hash, refreshToken.hashCode);
    _$hash = $jc(_$hash, tokenType.hashCode);
    _$hash = $jc(_$hash, accessExpiresAt.hashCode);
    _$hash = $jc(_$hash, refreshExpiresAt.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NativeSessionResponse')
          ..add('user', user)
          ..add('accessToken', accessToken)
          ..add('refreshToken', refreshToken)
          ..add('tokenType', tokenType)
          ..add('accessExpiresAt', accessExpiresAt)
          ..add('refreshExpiresAt', refreshExpiresAt))
        .toString();
  }
}

class NativeSessionResponseBuilder
    implements Builder<NativeSessionResponse, NativeSessionResponseBuilder> {
  _$NativeSessionResponse? _$v;

  UserResponseBuilder? _user;
  UserResponseBuilder get user => _$this._user ??= UserResponseBuilder();
  set user(UserResponseBuilder? user) => _$this._user = user;

  String? _accessToken;
  String? get accessToken => _$this._accessToken;
  set accessToken(String? accessToken) => _$this._accessToken = accessToken;

  String? _refreshToken;
  String? get refreshToken => _$this._refreshToken;
  set refreshToken(String? refreshToken) => _$this._refreshToken = refreshToken;

  NativeSessionResponseTokenTypeEnum? _tokenType;
  NativeSessionResponseTokenTypeEnum? get tokenType => _$this._tokenType;
  set tokenType(NativeSessionResponseTokenTypeEnum? tokenType) =>
      _$this._tokenType = tokenType;

  DateTime? _accessExpiresAt;
  DateTime? get accessExpiresAt => _$this._accessExpiresAt;
  set accessExpiresAt(DateTime? accessExpiresAt) =>
      _$this._accessExpiresAt = accessExpiresAt;

  DateTime? _refreshExpiresAt;
  DateTime? get refreshExpiresAt => _$this._refreshExpiresAt;
  set refreshExpiresAt(DateTime? refreshExpiresAt) =>
      _$this._refreshExpiresAt = refreshExpiresAt;

  NativeSessionResponseBuilder() {
    NativeSessionResponse._defaults(this);
  }

  NativeSessionResponseBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user.toBuilder();
      _accessToken = $v.accessToken;
      _refreshToken = $v.refreshToken;
      _tokenType = $v.tokenType;
      _accessExpiresAt = $v.accessExpiresAt;
      _refreshExpiresAt = $v.refreshExpiresAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NativeSessionResponse other) {
    _$v = other as _$NativeSessionResponse;
  }

  @override
  void update(void Function(NativeSessionResponseBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NativeSessionResponse build() => _build();

  _$NativeSessionResponse _build() {
    _$NativeSessionResponse _$result;
    try {
      _$result = _$v ??
          _$NativeSessionResponse._(
            user: user.build(),
            accessToken: BuiltValueNullFieldError.checkNotNull(
                accessToken, r'NativeSessionResponse', 'accessToken'),
            refreshToken: BuiltValueNullFieldError.checkNotNull(
                refreshToken, r'NativeSessionResponse', 'refreshToken'),
            tokenType: BuiltValueNullFieldError.checkNotNull(
                tokenType, r'NativeSessionResponse', 'tokenType'),
            accessExpiresAt: BuiltValueNullFieldError.checkNotNull(
                accessExpiresAt, r'NativeSessionResponse', 'accessExpiresAt'),
            refreshExpiresAt: BuiltValueNullFieldError.checkNotNull(
                refreshExpiresAt, r'NativeSessionResponse', 'refreshExpiresAt'),
          );
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'user';
        user.build();
      } catch (e) {
        throw BuiltValueNestedFieldError(
            r'NativeSessionResponse', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
