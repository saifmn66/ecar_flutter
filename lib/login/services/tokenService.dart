import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';

class TokenService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  static const String _tokenKey = 'accessToken';

  Future<void> saveToken(String token) async {
    await _storage.write(key: _tokenKey, value: token);
  }

  Future<String?> getToken() async {
    return await _storage.read(key: _tokenKey);
  }

  Future<void> deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }

  Future<void> decodeAndPrintToken() async {
    final token = await getToken();
    if (token != null) {
      try {
        final jwt = JWT.decode(token);
        print('Decoded Token: ${jwt.payload}');
      } catch (e) {
        print('Error decoding token: $e');
      }
    } else {
      print('No token found.');
    }
  }
}