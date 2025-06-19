import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

Future<bool> login(String username, String password) async {
  final url = Uri.parse(dotenv.env['API_URL'] ?? '');

  final response = await http.post(url, headers: {
    'Content-Type': 'application/json',
  },
  body: jsonEncode({
    "usuario": username,
    "password": password,
  }));

  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}