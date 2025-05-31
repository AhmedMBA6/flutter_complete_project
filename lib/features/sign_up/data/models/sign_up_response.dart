import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
  String? message;
  @JsonKey(name: 'data')
  UserData? userData;
  int? code;
  bool? status;

  SignUpResponse({this.message, this.userData, this.code, this.status});

  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  @JsonKey(name: 'username')
  String? userName;
  String? token;

  UserData({this.userName, this.token});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
