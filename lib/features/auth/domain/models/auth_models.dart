/// Request model containing user login credentials.
class LoginModel {
  final String email;
  final String password;

  const LoginModel({
    required this.email,
    required this.password,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}

/// Request model containing workshop registration data.
class RegisterModel {
  final String workshopName;
  final String phone;
  final String email;
  final String address;
  final String password;
  final String passwordConfirmation;

  const RegisterModel({
    required this.workshopName,
    required this.phone,
    required this.email,
    required this.address,
    required this.password,
    required this.passwordConfirmation,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      workshopName: json['workshop_name'] as String? ?? json['name'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      email: json['email'] as String? ?? '',
      address: json['address'] as String? ?? '',
      password: json['password'] as String? ?? '',
      passwordConfirmation: json['password_confirmation'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'workshop_name': workshopName,
    'phone': phone,
    'email': email,
    'address': address,
    'password': password,
    'password_confirmation': passwordConfirmation,
  };
}
