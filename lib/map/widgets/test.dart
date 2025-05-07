import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: 'http://192.168.122.1:3000',
      connectTimeout: const Duration(seconds: 5),
    ),
  );

  List<dynamic> stations = []; // Store fetched data here
  bool isLoading = true; // Track loading state
  String errorMessage = ''; // Store errors if any

  @override
  void initState() {
    super.initState();
    fetchPosts(); // Automatically call when page opens
  }

  Future<void> fetchPosts() async {
    try {
      final response = await _dio.get('/station/');
      setState(() {
        stations = response.data; // Update UI with new data
        isLoading = false;
      });
    } on DioException catch (e) {
      setState(() {
        errorMessage = 'Error: ${e.message}';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stations List')),
      body:
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : errorMessage.isNotEmpty
              ? Center(child: Text(errorMessage))
              : ListView.builder(
                itemCount: stations.length,
                itemBuilder: (context, index) {
                  final station = stations[index];
                  return ListTile(
                    title: Text(station['Name'] ?? 'No Name'),
                    subtitle: Text('ID: ${station['id']}'),
                  );
                },
              ),
    );
  }
}
