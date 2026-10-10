// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthUserModelImpl _$$AuthUserModelImplFromJson(Map<String, dynamic> json) =>
    _$AuthUserModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: json['role'] as String? ?? 'user',
    );

Map<String, dynamic> _$$AuthUserModelImplToJson(_$AuthUserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'role': instance.role,
    };

_$AuthSessionModelImpl _$$AuthSessionModelImplFromJson(
  Map<String, dynamic> json,
) => _$AuthSessionModelImpl(
  accessToken: json['accessToken'] as String,
  refreshToken: json['refreshToken'] as String,
  approvalStatus: $enumDecode(
    _$AuthApprovalStatusEnumMap,
    json['approvalStatus'],
  ),
  user: AuthUserModel.fromJson(json['user'] as Map<String, dynamic>),
);

Map<String, dynamic> _$$AuthSessionModelImplToJson(
  _$AuthSessionModelImpl instance,
) => <String, dynamic>{
  'accessToken': instance.accessToken,
  'refreshToken': instance.refreshToken,
  'approvalStatus': _$AuthApprovalStatusEnumMap[instance.approvalStatus]!,
  'user': instance.user,
};

const _$AuthApprovalStatusEnumMap = {
  AuthApprovalStatus.pending: 'pending',
  AuthApprovalStatus.rejected: 'rejected',
  AuthApprovalStatus.approved: 'approved',
};

_$LoginRequestModelImpl _$$LoginRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$LoginRequestModelImpl(
  email: json['email'] as String,
  password: json['password'] as String,
);

Map<String, dynamic> _$$LoginRequestModelImplToJson(
  _$LoginRequestModelImpl instance,
) => <String, dynamic>{'email': instance.email, 'password': instance.password};

_$RegisterRequestModelImpl _$$RegisterRequestModelImplFromJson(
  Map<String, dynamic> json,
) => _$RegisterRequestModelImpl(
  name: json['name'] as String,
  email: json['email'] as String,
  password: json['password'] as String,
  passwordConfirmation: json['passwordConfirmation'] as String,
);

Map<String, dynamic> _$$RegisterRequestModelImplToJson(
  _$RegisterRequestModelImpl instance,
) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'password': instance.password,
  'passwordConfirmation': instance.passwordConfirmation,
};
