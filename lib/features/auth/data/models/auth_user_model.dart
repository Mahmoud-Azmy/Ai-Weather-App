import 'package:ai_weather_app/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel(
      {required super.name, required super.email, required super.password});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      password: json['password']??'',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
}
