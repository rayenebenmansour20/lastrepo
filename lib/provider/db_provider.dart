import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../components/loginpage.dart';
import '../utils/routers.dart';

class DatabaseProvider extends ChangeNotifier {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  String _token = '';
  String _userName = '';

  String _userId = '';

  File? _imageFile; // <-- A

  String get username => _userName;
  String get token => _token;
  String get userId => _userId;

  void saveToken(String token) async {
    SharedPreferences value = await _pref;

    value.setString('token', token);
  }

  void saveUserId(String id) async {
    SharedPreferences value = await _pref;

    value.setString('id', id);
  }

  void saveUserName(String username) async {
    SharedPreferences value = await _pref;
    value.setString('username', username);
  }
    void saveRefreshToken(String refreshToken) async {
    SharedPreferences value = await _pref;
    value.setString('refreshToken', refreshToken);
  }
  void saveSessionId(String sessionid) async{
    SharedPreferences value = await _pref;
    value.setString('sessionid', sessionid);
  }

  Future<String> getSessionID() async {
    SharedPreferences value = await _pref;
    if (value.containsKey('sessionid')){
      String sessionid = value.getString('sessionid')!;
      return sessionid;
          }
          else{
            return '';
          }
  }

  Future<String> getRefreshToken() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('refreshToken')) {
      String refreshToken = value.getString('refreshToken')!;
      return refreshToken;
    } else {
      return '';
    }
  }

  Future<String> getToken() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('token')) {
      String data = value.getString('token')!;
      _token = data;
      notifyListeners();
      return data;
    } else {
      _token = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getUserId() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('id')) {
      String data = value.getString('id')!;
      _userId = data;
      notifyListeners();
      return data;
    } else {
      _userId = '';
      notifyListeners();
      return '';
    }
  }

  Future<String> getUserName() async {
    SharedPreferences value = await _pref;

    if (value.containsKey('username')) {
      String data = value.getString('username')!;
      _userName = data;
      notifyListeners();
      return data;
    } else {
      _userId = '';
      notifyListeners();
      return '';
    }
  }

  void saveSelectedPageIndex(int index) async {
    SharedPreferences value = await _pref;
    value.setInt('selectedPageIndex', index);
  }

  Future<int> getSelectedPageIndex() async {
    SharedPreferences value = await _pref;
    if (value.containsKey('selectedPageIndex')) {
      int data = value.getInt('selectedPageIndex')!;
      return data;
    } else {
      return 0;
    }
  }

  Future<Map<String, dynamic>> getUserData() async {
    final value = await _pref;
    final token = value.getString('token');

    final response = await http.get(
      Uri.parse('http://51.178.142.70:8010/DMERP/v1/auth/user/'),
      headers: {'Authorization': 'Bearer $token'},
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data;
    } else {
      throw Exception('Failed to load user data');
    }
  }

  // Add pickImage method
  Future<void> pickImage(ImageSource source) async {
    // ignore: deprecated_member_use
    final pickedFile = await ImagePicker().getImage(source: source);
    if (pickedFile != null) {
      _imageFile = File(pickedFile.path);
      notifyListeners();
    }
  }

  // Add imageFile getter
  File? get imageFile => _imageFile;

  void logOut(BuildContext context) async {
    final token = await getToken();
  String sessionid = await getSessionID();  // Convert sessionid to a string

  // Close the session using the provided API
  http.Response closeSessionResponse = await http.post(
    Uri.parse('http://51.178.142.70:8010/DMERP/v1/Caisse/MiseEnAttenteSession/'),
    headers: {'Authorization': 'Bearer $token'},
    body: {
      'ID_ROWID':sessionid, // Replace with the correct ID_ROWID value
      'CHCTTR': '0',
    },
  );

  if (closeSessionResponse.statusCode == 200 || closeSessionResponse.statusCode == 201) {
    print("Session closed successfully");
  } else {
    print("Failed to close session");
  }

    final value = await _pref;
    value.clear();

    // ignore: use_build_context_synchronously
    PageNavigator(ctx: context).nextPageOnly(page: const loginpageversion());
  }
}




