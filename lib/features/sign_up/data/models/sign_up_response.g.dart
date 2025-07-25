// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      message: json['message'] as String?,
      userData:
          json['data'] == null
              ? null
              : UserData.fromJson(json['data'] as Map<String, dynamic>),
      code: (json['code'] as num?)?.toInt(),
      status: json['status'] as bool?,
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.userData,
      'code': instance.code,
      'status': instance.status,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
  userName: json['username'] as String?,
  token: json['token'] as String?,
);

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
  'username': instance.userName,
  'token': instance.token,
};
