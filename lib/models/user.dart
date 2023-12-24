import 'package:dio/dio.dart';

class User{
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;
  static int totalUsers = 999;
  static final _dio = Dio(
    BaseOptions(
      baseUrl: 'https://reqres.in/api',
    ),
  );

  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'first_name': firstName,
    'last_name': lastName,
    'avatar': avatar,
  };

  static Future<List<User>> getUsers(int page, int pageSize) async {
    try {
      final response = await _dio.get('/users?page=$page&per_page=$pageSize');
      final data = response.data['data'] as List;
      totalUsers = response.data['total'];
      return data.map((json) => User.fromJson(json)).toList();
    } catch (e) {
      rethrow;
    }
  }
}