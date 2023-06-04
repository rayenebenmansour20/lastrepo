import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

import '../constants/constants.dart';
import '../constants/responsive.dart';
import '../constants/colors.dart';
import '../constants/app_icons.dart';
import '../constants/app_style.dart';
import '../provider/auth_provider.dart';
import '../utils/snack_messages.dart';

class loginpageversion extends StatefulWidget {
  const loginpageversion({Key? key}) : super(key: key);

  @override
  State<loginpageversion> createState() => _loginpageversionState();
}

class _loginpageversionState extends State<loginpageversion> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  List<String> _emailList = ['rayenebenmansour20@gmail.com'];
  String? _selectedEmail;
  bool _isEmailEmpty = false;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();
    _getEmailListFromSharedPreferences().then((emails) {
      setState(() {
        _emailList = emails ?? [];
        _selectedEmail = _emailList.isNotEmpty ? _emailList.first : null;
        _emailController.text = _selectedEmail ?? '';
      });
    });

    _emailController.addListener(() {
      setState(() {
        _isEmailEmpty = _emailController.text.isEmpty;
      });
    });
  }

  Future<List<String>?> _getEmailListFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('emailList');
  }

  Future<void> _saveEmailList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('emailList', _emailList);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/shopping-box.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
              child: Container(
                padding: const EdgeInsets.all(0),
                height: height,
                width: width / 3,
                margin: EdgeInsets.symmetric(
                  horizontal: Responsive.isMobile(context)
                      ? height * 0.032
                      : height * 0.12,
                ),
                decoration: BoxDecoration(
                  color: appcolors.backColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height / 6,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/images/datamasterlogo.png',
                          fit: BoxFit.contain,
                          height: 70,
                        ),
                      ),
                      SizedBox(height: height * 0.1),
                      const SizedBox(height: 6.0),
                      Center(
                        child: Container(
                          height: 43.0,
                          width: width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: appcolors.whiteColor,
                            border: Border.all(
                              color: _isEmailEmpty ? Colors.red : Colors.transparent,
                            ),
                          ),
                          child: Stack(
                            children: [
                              TypeAheadFormField<String>(
                                textFieldConfiguration: TextFieldConfiguration(
                                  controller: _emailController,
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
                                              BlendMode.srcIn,
                                            ),
                                            child: Image.asset(AppIcons.emailIcon),
                                          ),
                                        ),
                                      ],
                                    ),
                                    contentPadding: const EdgeInsets.only(top: 16.0, left: 16),
                                    hintText: 'Enter your email',
                                    hintStyle: ralewayStyle.copyWith(
                                      fontWeight: FontWeight.w400,
                                      color: appcolors.blueDarkColor.withOpacity(0.5),
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  style: ralewayStyle.copyWith(
                                    fontWeight: FontWeight.w400,
                                    color: appcolors.blueDarkColor,
                                    fontSize: 12.0,
                                  ),
                                ),
                                suggestionsCallback: (pattern) async {
                                  return _emailList
                                      .where((email) => email.contains(pattern))
                                      .toList();
                                },
                                itemBuilder: (context, String suggestion) {
                                  return ListTile(
                                    title: Text(suggestion),
                                  );
                                },
                                onSuggestionSelected: (String suggestion) {
                                  setState(() {
                                    _selectedEmail = suggestion;
                                    _emailController.text = suggestion;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: height * 0.040),
                      const SizedBox(height: 6.0),
                      Center(
                        child: Container(
                          height: 45.0,
                          width: width / 4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4.0),
                            color: appcolors.whiteColor,
                            border: Border.all(
                              color: _isEmailEmpty ? Colors.red : Colors.transparent,
                            ),
                          ),
                          child: TextFormField(
                            controller: _passwordController,
                            /*validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Veuillez entre votre mot de passe';
                              }
                              return null;
                            },*/
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
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.blue,
                                ),
                                onPressed: _togglePasswordVisibility,
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
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: ColorFiltered(
                                      colorFilter: const ColorFilter.mode(
                                        Colors.white,
                                        BlendMode.srcIn,
                                      ),
                                      child: Image.asset(AppIcons.lockIcon),
                                    ),
                                  ),
                                ],
                              ),
                              contentPadding:
                                  const EdgeInsets.only(top: 16.0),
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
                      Consumer<AuthenticationProvider>(
                        builder: (context, auth, child) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            if (auth.resMessage != '') {
                              showMessage(
                                message: auth.resMessage,
                                context: context,
                              );

                              ///Clear the response message to avoid duplicate
                              auth.clear();
                            }
                          });
                          return Material(
                            borderRadius: BorderRadius.circular(4.0),
                            child: InkWell(
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                                    showMessage(
                                      message: "All fields are required",
                                      context: context,
                                    );
                                  } else {
                                    String enteredEmail = _emailController.text;
                                    bool isNewEmail = !_emailList.contains(enteredEmail);

                                    setState(() {
                                      _selectedEmail = enteredEmail;
                                    });

                                    if (isNewEmail) {
                                      _emailList.add(enteredEmail);
                                      _saveEmailList().then((_) {
                                        // Save the updated email list
                                        auth.loginUser(
                                          context: context,
                                          email: enteredEmail,
                                          password: _passwordController.text,
                                        );
                                      });
                                    } else {
                                      auth.loginUser(
                                        context: context,
                                        email: enteredEmail,
                                        password: _passwordController.text,
                                      );
                                    }
                                  }
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
                                    child: auth.isLoggingIn
                                        ? const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        appcolors.whiteColor,
                                      ),
                                    )
                                        : Text(
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
                          );
                        },
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
                            const SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/images/datamasterpetitlogo.png',
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