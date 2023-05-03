


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/loginpage.dart';
import '../components/loginpageauth.dart';
import '../components/sidemenu.dart';
import '../constants/constants.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: bgColor,
        drawer: const Sidemenu(),
        body: const SafeArea(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Sidemenu()),
            ],
          ),
        ),
      );
    } 
  }

