import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:coffeskuyapp/services/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AuthServices{
  static Future<http.Response> register(
      String name, String email, String password) async{
    Map data = {
      "name":name,
      "email":email,
      "password":password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL+ 'auth/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> login(
      String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    var responseData = json.decode(response.body);
    if (response.statusCode == 200) {
      // Store token and username in SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', responseData['token']);
      await prefs.setString('email', email);
    }
    print(response.body);
    return response;
  }

  static Future<void> logout() async {
    // Clear user session data from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('username');
    // Add additional keys if needed
  }
}