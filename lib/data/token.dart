import 'package:equatable/equatable.dart';

class Token extends Equatable{
  final String token;

  Token({
    required this.token
  });

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      token: json['token'] ?? ''
    );
  }

  @override
  List<Object> get props => [
    token
  ];
}

class TokenResponse extends Equatable{
  final bool success;
  final List<Token> data;
  final String message;
  TokenResponse({
    required this.data,
    required this.message,
    required this.success
  });

  factory TokenResponse.fromJson(Map<String, dynamic> json) {
    return TokenResponse(
      data: json['data'], 
      message: json['message'], 
      success: json['success']
    );
  }

  @override
  List<Object> get props => [
    success,
    message,
    data
  ];
}

class Admin extends Equatable {
  final String id;
  final String email;
  final String name;
  final String role;
  Admin({
    required this.email,
    required this.id,
    required this.name,
    required this.role
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    final admin = json['data']['admin'];
    return Admin(
      email: admin['email'], 
      id: admin['id'], 
      name: admin['name'], 
      role: admin['role']
    );
  }

  @override
  List<Object> get props => [
    email,
    id,
    name,
    role
  ];
}
