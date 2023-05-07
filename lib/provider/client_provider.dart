import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:newapp/provider/db_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/model/client.dart';

class ClientProvider with ChangeNotifier {
  List<dynamic> _clients = [];
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  List<dynamic> get clients => _clients;

  Future<List<dynamic>> fetchClients() async {
    SharedPreferences value = await _pref;
    String token = value.getString('token')!;

    final response = await http.get(
      Uri.parse('http://51.178.142.70:8010/DMERP/v1/Caisse/Client/'),
      headers: {'Authorization': 'Bearer $token'},
    );
    if (response.statusCode == 200) {
      final dynamic jsonData = jsonDecode(response.body);
      final List<dynamic> clients =
          jsonData.map((json) => Client.fromJson(json)).toList();
      _clients = clients;
      notifyListeners();
      return jsonData;
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
