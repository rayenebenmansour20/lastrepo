import 'package:flutter/material.dart';
import 'package:newapp/provider/auth_provider.dart';
import 'package:newapp/provider/client_provider.dart';
import 'package:newapp/provider/db_provider.dart';
import 'package:newapp/provider/notification_provider.dart';
import 'package:newapp/splash.dart';
import 'package:provider/provider.dart';

import 'constants/constants.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ChangeNotifierProvider(create: (_) => DatabaseProvider()),
        ChangeNotifierProvider(create: (_) => ClientProvider()),
        ChangeNotifierProvider(create: (_) => ToggleProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: primaryColor,
          ),
          floatingActionButtonTheme:
              const FloatingActionButtonThemeData(
            backgroundColor: primaryColor,
          ),
          primaryColor: primaryColor,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
