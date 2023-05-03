import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newapp/screens/dashboard_screen.dart';

import '../utils/routers.dart';
import 'db_provider.dart';

class AuthenticationProvider extends ChangeNotifier {
  ///Base Url
final requestBaseUrl = 'http://51.178.142.70:8010/DMERP/v1/auth/login/';

  ///Setter
  bool _isLoading = false;
  String _resMessage = '';

  //Getter
  bool get isLoading => _isLoading;
  String get resMessage => _resMessage;


  //Login
  void loginUser({
    required String email,
    required String password,
    BuildContext? context,
  }) async {
    _isLoading = true;
    notifyListeners();
    try {
      http.Response req =
        await http.post(
      Uri.parse('http://51.178.142.70:8010/DMERP/v1/auth/login/'),
      body: {
        'email': email,
        'password': password,
      },
    );

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);

        print(res);
        _isLoading = false;
        _resMessage = "Login successfull!";
        notifyListeners();

        ///Save users data and then navigate to homepage
        final userId = res['user']['id'].toString();
        final token = res['access_token'];
        DatabaseProvider().saveToken(token);
        DatabaseProvider().saveUserId(userId);
        print("user id: $userId");
        http.Response verifyReq = await http.post(
        Uri.parse('http://51.178.142.70:8010/DMERP/v1/auth/token/verify/'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

       if (verifyReq.statusCode == 200) {
        // Token is valid, do nothing
      } else if (verifyReq.statusCode == 401) {
        // Token is invalid, refresh token
        http.Response refreshReq = await http.post(
          Uri.parse('http://51.178.142.70:8010/DMERP/v1/auth/token/refresh/'),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (refreshReq.statusCode == 200) {
          final newToken = json.decode(refreshReq.body)['access_token'];
          DatabaseProvider().saveToken(newToken);
        } else {
          // Refresh token failed, logout user
          DatabaseProvider().logOut(context!);
        }
      }

        PageNavigator(ctx: context).nextPageOnly(page: const DashBoardScreen());
      } else {
        final res = json.decode(req.body);

        _resMessage = res['message'];

        print(res);
        _isLoading = false;
        notifyListeners();
      }
    } on SocketException catch (_) {
      _isLoading = false;
      _resMessage = "Internet connection is not available`";
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _resMessage = "Please try again`";
      notifyListeners();

      print(":::: $e");
    }
  }

  void clear() {
    _resMessage = "";
    // _isLoading = false;
    notifyListeners();
  }
}
