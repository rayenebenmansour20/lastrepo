import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/sidemenucontroller.dart';
import 'dashboard_screen.dart';


// ignore: camel_case_types
class firstpageversion extends StatefulWidget {
  const firstpageversion({super.key});

  @override
  State<firstpageversion> createState() => _firstpageversionState();
}

// ignore: camel_case_types
class _firstpageversionState extends State<firstpageversion> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Admin Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Controller(),)
        ],
        child:const DashBoardScreen(),
      ),
    );
  }
}
