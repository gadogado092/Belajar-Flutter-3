import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

class User {
  static const String keyIsLogin = 'is_login';
  static const String keyToken = 'token';
  static const String keyName = 'name';

  final bool? isLogin;
  final String token;
  final String name;

  User({
    this.isLogin,
    required this.token,
    required this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(token: json['token'], name: json['name'], isLogin: true);
  }
}
