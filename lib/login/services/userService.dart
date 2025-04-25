import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/userModel.dart';

class UserController {
  final String baseUrl =
      'http://10.0.2.2:3000/user/'; // Replace with your API URL

  // Create a new user (POST request)
  Future<void> createUser(User user) async {
    final url = Uri.parse(baseUrl); // Endpoint for creating a user

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()), // Convert User object to JSON
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

  // Fetch user data by ID (GET request)
}
