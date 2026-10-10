import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_models.freezed.dart';
part 'auth_models.g.dart';

/// Server-side approval state for an authenticated account.
enum AuthApprovalStatus {
  @JsonValue('pending')
  pending,
  @JsonValue('rejected')
  rejected,
  @JsonValue('approved')
  approved,
}

@freezed
class AuthUserModel with _$AuthUserModel {
  const factory AuthUserModel({
    required String id,
    required String name,
    required String email,
    @Default('user') String role,
  }) = _AuthUserModel;

  factory AuthUserModel.fromJson(Map<String, dynamic> json) =>
      _$AuthUserModelFromJson(json);
}

@freezed
class AuthSessionModel with _$AuthSessionModel {
  const factory AuthSessionModel({
    required String accessToken,
    required String refreshToken,
    required AuthApprovalStatus approvalStatus,
    required AuthUserModel user,
  }) = _AuthSessionModel;

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) =>
      _$AuthSessionModelFromJson(json);
}

@freezed
class LoginRequestModel with _$LoginRequestModel {
  const factory LoginRequestModel({
    required String email,
    required String password,
  }) = _LoginRequestModel;

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestModelFromJson(json);
}

@freezed
class RegisterRequestModel with _$RegisterRequestModel {
  const factory RegisterRequestModel({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) = _RegisterRequestModel;

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestModelFromJson(json);
}
