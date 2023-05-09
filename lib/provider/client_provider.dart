import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
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
      Uri.parse('http://51.178.142.70:8010/DMERP/v1/Caisse/Client/?page=1'),
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


   Future<String?> addClient(Client client) async {
  SharedPreferences prefs = await _pref;
  String token = prefs.getString('token')!;
  final response = await http.post(
    Uri.parse('http://51.178.142.70:8010/DMERP/v1/Caisse/Client/'),
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    },
    body: jsonEncode(client),
  );

  if (response.statusCode == 200) {
    final dynamic jsonData = jsonDecode(response.body);
    Client newClient = Client.fromJson(jsonData);
    _clients.add(newClient);
    notifyListeners();
    return null;
  } else {
    final dynamic jsonData = jsonDecode(response.body);
    String errorMessage = jsonData['detail'];
    return errorMessage;
  }
}


}
