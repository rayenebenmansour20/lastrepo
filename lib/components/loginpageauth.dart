import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newapp/components/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthState with ChangeNotifier {
  bool _isAuthenticated = false;
  String _accessToken = '';

  bool get isAuthenticated => _isAuthenticated;
  String get accessToken => _accessToken;

  String get token => _accessToken; // define the token getter

  Future<bool> login(String email, String password) async {
    final response = await http.post(
      Uri.parse('http://51.178.142.70:8010/DMERP/v1/auth/login/'),
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      _accessToken = data['access_token'];
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('access_token', _accessToken);
      print('access_token: $_accessToken');
      _isAuthenticated = true;
      notifyListeners();
      return true;
    } else {
      _isAuthenticated = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> refreshToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final previousToken = prefs.getString('access_token');

  final response = await http.post(
    Uri.parse('http://51.178.142.70:8010/DMERP/v1/auth/login/'),
    headers: {
      'Authorization': 'Bearer $previousToken',
    },
  );

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    _accessToken = data['access_token'];
    await prefs.setString('access_token', _accessToken);
    print('access_token: $_accessToken');
    notifyListeners();
  } else if (response.statusCode == 401) { // unauthorized error
    final errorResponse = jsonDecode(response.body.toString());
    final error = errorResponse['detail'];
    if (error.contains('token expired')) {
      // token expired, show error message and logout user
      print('Token expired: $error');
      await logout();
    } else {
      // other error, logout user
      print('Error refreshing token: $error');
      await logout();
    }
  } else {
    // other error, logout user
    print('Error refreshing token: ${response.statusCode}');
    await logout();
  }
}

Future<void> logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('access_token');
  _accessToken = '';
  _isAuthenticated = false;
  notifyListeners();
  // navigate user to the login page after logout
Navigator.of(context as BuildContext).pushAndRemoveUntil(
  MaterialPageRoute(builder: (context) => const loginpageversion()),
  (route) => false
);}

}
