//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_import

import 'package:one_of_serializer/any_of_serializer.dart';
import 'package:one_of_serializer/one_of_serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'package:built_value/json_object.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:built_value/iso_8601_date_time_serializer.dart';
import 'package:video_server_api/lib/date_serializer.dart';
import 'package:video_server_api/lib/model/date.dart';

import 'package:video_server_api/lib/model/email_password_request.dart';
import 'package:video_server_api/lib/model/native_logout_request.dart';
import 'package:video_server_api/lib/model/native_refresh_request.dart';
import 'package:video_server_api/lib/model/native_session_response.dart';
import 'package:video_server_api/lib/model/problem_details.dart';
import 'package:video_server_api/lib/model/register_request.dart';
import 'package:video_server_api/lib/model/user_response.dart';
import 'package:video_server_api/lib/model/user_role.dart';

part 'serializers.g.dart';

@SerializersFor([
  EmailPasswordRequest,
  NativeLogoutRequest,
  NativeRefreshRequest,
  NativeSessionResponse,
  ProblemDetails,
  RegisterRequest,
  UserResponse,
  UserRole,
])
Serializers serializers = (_$serializers.toBuilder()
      ..add(const OneOfSerializer())
      ..add(const AnyOfSerializer())
      ..add(const DateSerializer())
      ..add(Iso8601DateTimeSerializer()))
    .build();

Serializers standardSerializers =
    (serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
