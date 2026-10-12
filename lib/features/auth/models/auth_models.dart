/// Server-side approval state for an authenticated account.
enum AuthApprovalStatus {
  pending,
  rejected,
  approved;

  String toJson() => name;

  static AuthApprovalStatus fromJson(String value) {
    return AuthApprovalStatus.values.firstWhere(
      (e) => e.name == value,
      orElse: () => AuthApprovalStatus.pending,
    );
  }
}

// ──────────────────────────────────────────────────────────
// AuthUserModel
// ──────────────────────────────────────────────────────────

class AuthUserModel {
  final String id;
  final String name;
  final String email;
  final String role;

  const AuthUserModel({
    required this.id,
    required this.name,
    required this.email,
    this.role = 'user',
  });

  factory AuthUserModel.fromJson(Map<String, dynamic> json) {
    return AuthUserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      role: (json['role'] as String?) ?? 'user',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'role': role,
      };

  AuthUserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? role,
  }) {
    return AuthUserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      role: role ?? this.role,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthUserModel &&
          id == other.id &&
          name == other.name &&
          email == other.email &&
          role == other.role;

  @override
  int get hashCode => Object.hash(id, name, email, role);

  @override
  String toString() => 'AuthUserModel(id: $id, name: $name, email: $email, role: $role)';
}

// ──────────────────────────────────────────────────────────
// AuthSessionModel
// ──────────────────────────────────────────────────────────

class AuthSessionModel {
  final String accessToken;
  final String refreshToken;
  final AuthApprovalStatus approvalStatus;
  final AuthUserModel user;

  const AuthSessionModel({
    required this.accessToken,
    required this.refreshToken,
    required this.approvalStatus,
    required this.user,
  });

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) {
    return AuthSessionModel(
      accessToken: json['accessToken'] as String,
      refreshToken: json['refreshToken'] as String,
      approvalStatus: AuthApprovalStatus.fromJson(json['approvalStatus'] as String),
      user: AuthUserModel.fromJson(json['user'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
        'refreshToken': refreshToken,
        'approvalStatus': approvalStatus.toJson(),
        'user': user.toJson(),
      };

  AuthSessionModel copyWith({
    String? accessToken,
    String? refreshToken,
    AuthApprovalStatus? approvalStatus,
    AuthUserModel? user,
  }) {
    return AuthSessionModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      approvalStatus: approvalStatus ?? this.approvalStatus,
      user: user ?? this.user,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthSessionModel &&
          accessToken == other.accessToken &&
          refreshToken == other.refreshToken &&
          approvalStatus == other.approvalStatus &&
          user == other.user;

  @override
  int get hashCode => Object.hash(accessToken, refreshToken, approvalStatus, user);

  @override
  String toString() =>
      'AuthSessionModel(status: $approvalStatus, user: ${user.email})';
}

// ──────────────────────────────────────────────────────────
// LoginRequestModel
// ──────────────────────────────────────────────────────────

class LoginRequestModel {
  final String email;
  final String password;

  const LoginRequestModel({
    required this.email,
    required this.password,
  });

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'email': email,
        'password': password,
      };
}

// ──────────────────────────────────────────────────────────
// RegisterRequestModel
// ──────────────────────────────────────────────────────────

class RegisterRequestModel {
  final String name;
  final String email;
  final String password;
  final String passwordConfirmation;

  const RegisterRequestModel({
    required this.name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  });

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    return RegisterRequestModel(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      passwordConfirmation: json['password_confirmation'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation,
      };
}
