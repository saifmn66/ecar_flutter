import 'dart:convert';
import 'package:e_car/login/services/tokenService.dart';
import 'package:http/http.dart' as http;
import '../models/userModel.dart';

class UserController {
  final TokenService tokenService = TokenService();
  final String baseUrl = 'http://192.168.122.1:3000/user/';

  Future<void> createUser(User user) async {
    final url = Uri.parse(baseUrl);

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 201) {
        print('User created successfully!');
        final responseData = jsonDecode(response.body);
        await tokenService.saveToken(responseData['accessToken']);
      } else {
        print('Failed to create user: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }
}
