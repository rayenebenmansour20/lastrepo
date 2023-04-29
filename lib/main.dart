import 'package:flutter/material.dart';
import 'package:newapp/components/loginpageauth.dart';

import 'components/loginpage.dart';

void main() {
  runApp(const MyApp());
}
//ewa kich l'affaire
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Admin Dashboard',  
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:   const loginpageversion(),
    );
  }
}

