import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/userModel.dart';

class UserController {
  final String baseUrl =
      'http://192.168.122.1:3000/user/';

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
      } else {
        print('Failed to create user: ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

}
