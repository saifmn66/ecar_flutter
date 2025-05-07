import 'dart:convert';
import 'package:e_car/login/services/tokenService.dart';
import 'package:http/http.dart' as http;
import '../models/stationModel.dart';

class StationService {
  final TokenService tokenService = TokenService();
  final String baseUrl = 'http://192.168.122.1:3000/station/';

  Future<List<Station>> getStations() async {
    final url = Uri.parse(baseUrl);
    final token = await tokenService.getToken();

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = jsonDecode(response.body);
        return responseData.map((station) => Station.fromJson(station)).toList();
      } else {
        throw Exception('Failed to load stations: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching stations: $e');
    }
  }
}