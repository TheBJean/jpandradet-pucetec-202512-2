import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<String> login(String username, String password) async {
  final url = Uri.parse(dotenv.env['API_URL'] ?? '');

  final response = await http.post(url, headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Basic ${base64Encode(utf8.encode('admin:65pT8HE9T4kQ'))}',
  },
  body: jsonEncode({
    "usuario": username,
    "password": password,
  }));

  if (response.statusCode == 200) {
    return response.body;
  } else {
    print("Error: ${response.statusCode} - ${response.body}");
    throw Exception("Error en el login");
  }
}