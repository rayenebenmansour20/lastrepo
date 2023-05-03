import 'package:flutter/material.dart';
import 'package:newapp/components/loginpage.dart';
import 'package:newapp/provider/db_provider.dart';
import 'package:newapp/screens/dashboard_screen.dart';
import 'package:newapp/utils/routers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: FlutterLogo()),
    );
  }

  void navigate() {
    Future.delayed(const Duration(seconds: 3), () {
      DatabaseProvider().getToken().then((value) {
        if (value == '') {
          PageNavigator(ctx: context).nextPageOnly(page: const loginpageversion());
        } else {
          PageNavigator(ctx: context).nextPageOnly(page: const DashBoardScreen());
        }
      });
    });
  }
}
