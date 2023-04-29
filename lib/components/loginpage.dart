import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:newapp/screens/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import '../constants/constants.dart';
import '../constants/responsive.dart';
import '../constants/colors.dart';
import '../constants/app_icons.dart';
import '../constants/app_style.dart';



// ignore: camel_case_types
class loginpageversion extends StatefulWidget {
  const loginpageversion({super.key});

  @override
  State<loginpageversion> createState() => _loginpageversionState();
}


// ignore: camel_case_types
class _loginpageversionState extends State<loginpageversion> {
  bool _obscureText = true;
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();


  

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  Future<bool> _login() async {
  final response = await http.post(
    Uri.parse('http://51.178.142.70:8010/DMERP/v1/auth/login/'),
    body: {
      'email': _emailController.text,
      'password': _passwordController.text,
    },
  );
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body.toString());
    print(data['access_token']);
    print('success');
    return true;
  } else {
    print('refus');
    return false;
  }
}



  @override
  Widget build(BuildContext context) {
     double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/shopping-box.jpg', // replace with your image file path
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0,15),
          child: Container(
                padding:const EdgeInsets.all(0),
                height: height,
                width: width/3,
                margin: EdgeInsets.symmetric(horizontal: Responsive.isMobile(context)? height * 0.032 : height * 0.12),
                decoration: BoxDecoration(
                  color: appcolors.backColor,
                 borderRadius: BorderRadius.circular(20), // add border radius
                  ),
                  child:Form(
                    key:_formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: height/6,),
                    Center(
                     child: Image.asset(
                            'assets/images/datamasterlogo.png',
                            fit: BoxFit.contain,
                            height: 70,
                            // Adjust the fit property as per your requirement
                                  ),),
                      SizedBox(height: height*0.1),
                      const SizedBox(height: 6.0),
                      Center(
                      child: Container(
                        height: 43.0,
                        width: width/4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: appcolors.whiteColor,
                        ),
                        child: TextFormField(
                          controller: _emailController,
                         validator: (value){
                          if ( value == null || value.isEmpty){
                            return 'Veuillez entre votre email';
                          }
                          return null;
                         },
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: appcolors.blueDarkColor,
                            fontSize: 12.0,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: Stack(
                             children: [
                              Positioned.fill(
                                child: Container(
                                decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(4),
                                ),
                                ),
                                 ),
                               IconButton(
                                onPressed: () {},
                                 icon: ColorFiltered(
                                 colorFilter: const ColorFilter.mode(
                                  Colors.white, 
                                 BlendMode.srcIn
                                 ),
                                child: Image.asset(AppIcons.emailIcon),
                                 ),
                                ),
                                  ],
                                ) ,

                            contentPadding: const EdgeInsets.only(top: 16.0,left: 16),
                            hintText: 'Entrer votre email',
                            hintStyle: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: appcolors.blueDarkColor.withOpacity(0.5),
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                      ),

                      SizedBox(height: height * 0.040),
                      const SizedBox(height: 6.0),
                      Center(
                      child: Container(
                        height: 45.0,
                        width:width/4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4.0),
                          color: appcolors.whiteColor,
                        ),
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value){
                            if (value == null || value.isEmpty){
                              return 'Veuillez entre votre mot de passe';
                            }
                            return null;
                          },
                          style: ralewayStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            color: appcolors.blueDarkColor,
                            fontSize: 12.0,
                          ),
                          obscureText: _obscureText,

                          decoration: InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: IconButton(
                              icon: Icon(
                                _obscureText ? Icons.visibility_off : Icons.visibility,
                                color:Colors.blue,
                              ), onPressed: _togglePasswordVisibility,
                             ),
                           suffixIcon: Stack(
                             children: [
                              Positioned.fill(
                                child: Container(
                                decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  width: 10,
                                  color:Colors.blue,
                                )
                                ),
                                ),
                                 ),
                               IconButton(
                                onPressed: () {},
                                 icon: ColorFiltered(
                                 colorFilter: const ColorFilter.mode(
                                  Colors.white, 
                                 BlendMode.srcIn
                                 ),
                                child: Image.asset(AppIcons.lockIcon),
                                 ),
                                ),
                                  ],
                                ) ,
                            contentPadding: const EdgeInsets.only(top: 16.0),
                            hintText: 'Enter Password',
                            hintStyle: ralewayStyle.copyWith(
                              fontWeight: FontWeight.w400,
                              color: appcolors.blueDarkColor.withOpacity(0.5),
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        
                      ),
                      ),
                      SizedBox(height: height * 0.05),
                     Material(
  child: InkWell(
    onTap: () async {
      bool isLoggedIn = await _login();
      if (isLoggedIn) {
        // do something if login was successful
         // ignore: use_build_context_synchronously
         Navigator.push(context, MaterialPageRoute(builder: (context) => const DashBoardScreen()));
      } else {
        // do something else if login was not successful
        // e.g. show an error message
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Echec de la connexion. Veuillez réessayer.'),
        ));
      }
    },
    child: Center(
      child: Ink(
        height: 43,
        width: width / 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: primaryColor,
        ),
        child: Center(
          child: Text(
            'LOGIN',
            style: ralewayStyle.copyWith(
              fontWeight: FontWeight.w800,
              color: appcolors.whiteColor,
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    ),
  ),
),

                   Center(
                     child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                              const Text(
                            'Copyright 2023',
                             style: TextStyle(
                             color: Colors.black,
                               ),
                                ),
                                 const SizedBox(width:10,),
                             Image.asset(
                               'assets/images/datamasterpetitlogo.png', // replace with your logo image path
                                width: 100,
                                height: 100,
                                   ),
                                ],
                              ),
                            ),
                    ],
                  ),
                  ),
              ),
          ),
          ),
        ],
      ),
    );
  }
}
