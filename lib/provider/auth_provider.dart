import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newapp/screens/dashboard_screen.dart';

import '../utils/routers.dart';
import 'db_provider.dart';

class AuthenticationProvider extends ChangeNotifier {
  ///Base Url
  final requestBaseUrl = 'http://51.178.142.70:8010/DMERP/v1/auth/login/';

  ///Setter
  ///
  final bool _isLoggingIn = false;
  bool _isLoading = false;
  String _resMessage = '';

  //Getter
    bool get isLoggingIn => _isLoggingIn;

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
      http.Response req = await http.post(
        Uri.parse(requestBaseUrl),
        body: {
          'email': email,
          'password': password,
          'terminal': '18',
        },
      );

      if (req.statusCode == 200 || req.statusCode == 201) {
        final res = json.decode(req.body);

        print(res);
        _isLoading = false;
        _resMessage = "Login successful!";
        notifyListeners();

        final userId = res['user']['id'].toString();
        final username = res['user']['username'].toString();
        final token = res['access_token'];
        final refreshToken = res['refresh_token'];
        DatabaseProvider().saveUserName(username);
        DatabaseProvider().saveToken(token);
        DatabaseProvider().saveUserId(userId);
        DatabaseProvider().saveRefreshToken(refreshToken);

        print("user id: $userId");
        http.Response verifyReq = await http.post(
            Uri.parse('http://51.178.142.70:8010/DMERP/v1/auth/token/verify/'),
            headers: {
              'Authorization': 'Bearer $token',
            },
            body: {
              'token': '$token'
            });

        if (verifyReq.statusCode == 200) {
          // Token is valid, do nothing
        } else if (verifyReq.statusCode == 401) {
          // Token is invalid, refresh token
          String refreshToken = await DatabaseProvider().getRefreshToken();
          http.Response refreshReq = await http.post(
            Uri.parse('http://51.178.142.70:8010/DMERP/v1/auth/token/refresh/'),
            body: {
              'refresh': refreshToken,
            },
          );

          if (refreshReq.statusCode == 200) {
            final newToken = json.decode(refreshReq.body)['access'];
            print(newToken);
            DatabaseProvider().saveToken(newToken);
          } else if (refreshReq.statusCode == 401) {
            // Refresh token is expired, perform a new login request
            loginUser(email: email, password: password, context: context);
          } else {
            // Refresh token failed, logout user
            DatabaseProvider().logOut(context!);
          }
        }

        http.Response sessionResponse = await http.post(
          Uri.parse('http://51.178.142.70:8010/DMERP/v1/Caisse/HisCaisse/'),
          headers: {'Authorization': 'Bearer $token'},
          body: {
            'CHCETAT': '0',
            'CHCSITEID': '1',
            'CHCTERMID': '18',
            'CHCTINTR': '0',
            'CHCUTLID': userId,
          },
        );

        if (sessionResponse.statusCode == 200 ||
            sessionResponse.statusCode == 201) {
              final seb = jsonDecode(sessionResponse.body);
              final sessionid = seb['ID_ROWID'].toString();
              DatabaseProvider().saveSessionId(sessionid);
                        print("Session opened successfully");
        } else {
          print("Failed to open session");
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
