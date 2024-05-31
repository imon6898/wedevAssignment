import 'dart:convert';
import 'package:http/http.dart' as http;

import '../utils/api.dart';

class UserService {
  Future<bool> updateProfile(String token, String firstName, String lastName) async {
    final response = await http.post(
      Uri.parse(Api.updateUser),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
      body: jsonEncode({'first_name': firstName, 'last_name': lastName}),
    );

    return response.statusCode == 200;
  }
}