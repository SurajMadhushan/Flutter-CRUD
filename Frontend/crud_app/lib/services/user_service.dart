// lib/services/user_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserService {
  // Method to add a new user
  Future<bool> addUser(User user) async {
    final url = Uri.parse(
        'http://192.168.8.191:8080/addUser'); // Adjust your API endpoint here

    try {
      // Make POST request to the server
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode(user.toJson()), // Convert the user object to JSON
      );

      if (response.statusCode == 201) {
        // Successfully added the user
        print("user added");
        return true;
      } else {
        // Something went wrong, print the error message
        print('Failed to add user: ${response.body}');
        return false;
      }
    } catch (error) {
      // Catch and print any error that occurred during the request
      print('Error adding user: $error');
      return false;
    }
  }

  // get all users

  Future<List<User>> getUsers() async {
    final String baseUrl2 = 'http://192.168.8.191:8080/getUsers';

    final url2 = Uri.parse(baseUrl2);
    try {
      final response = await http.get(url2);
      print(response.statusCode);

      if (response.statusCode == 200) {
        List<dynamic> userListJson = jsonDecode(response.body);

        // Check if the user list is parsed correctly
        print('Parsed JSON: $userListJson');
        
        return userListJson.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load users");
      }
    } catch (e) {
      print("Error occured: $e");
      return [];
    }
  }
}
