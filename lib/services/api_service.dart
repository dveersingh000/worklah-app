import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://freelancing-lep8.onrender.com"; // Replace with your backend URL

  /// Generic GET request
  Future<Map<String, dynamic>> get(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    try {
      final response = await http.get(url, headers: _defaultHeaders());
      return _processResponse(response);
    } catch (e) {
      throw Exception('Error in GET request: $e');
    }
  }

  /// Generic POST request
  Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    try {
      final response = await http.post(
        url,
        headers: _defaultHeaders(),
        body: jsonEncode(body),
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception('Error in POST request: $e');
    }
  }

  /// Generic PUT request
  Future<Map<String, dynamic>> put(String endpoint, Map<String, dynamic> body) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    try {
      final response = await http.put(
        url,
        headers: _defaultHeaders(),
        body: jsonEncode(body),
      );
      return _processResponse(response);
    } catch (e) {
      throw Exception('Error in PUT request: $e');
    }
  }

  /// Generic DELETE request
  Future<Map<String, dynamic>> delete(String endpoint) async {
    final url = Uri.parse('$baseUrl/$endpoint');
    try {
      final response = await http.delete(url, headers: _defaultHeaders());
      return _processResponse(response);
    } catch (e) {
      throw Exception('Error in DELETE request: $e');
    }
  }

  /// Headers for requests
  Map<String, String> _defaultHeaders() {
    return {
      'Content-Type': 'application/json',
    };
  }

  /// Process the HTTP response
  Map<String, dynamic> _processResponse(http.Response response) {
    final responseBody = jsonDecode(response.body);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return responseBody;
    } else {
      throw Exception(responseBody['message'] ?? 'An error occurred');
    }
  }

  /// Example: Register user
  Future<Map<String, dynamic>> registerUser(
      String fullName, String phoneNumber, String email, String employmentStatus) async {
    return post('register', {
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'email': email,
      'employmentStatus': employmentStatus,
    });
  }

  /// Example: Login user
  Future<Map<String, dynamic>> loginUser(String phoneNumber, String otp) async {
    return post('login', {
      'phoneNumber': phoneNumber,
      'otp': otp,
    });
  }

  /// Example: Fetch jobs
  Future<Map<String, dynamic>> fetchJobs() async {
    return get('jobs');
  }
}
