import 'package:demoaqua/screens/instrucciones_screen.dart';
import 'package:flutter/widgets.dart';
import '../screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'dart:io';
import '../constants.dart';
import '../custom_widgets/custom_botton.dart';
import '../screens/screen_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demoaqua/logic/user_class.dart';
import 'package:demoaqua/custom_widgets/custom_animatedLogo.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String heroTag = 'logoTag';
  User currentUser;
  final _auth = FirebaseAuth.instance;
  String _emailTF = '';
  String _passwordTF = '';
  File _image;
  bool _isChecked = true;
  bool _showSpinner = false;

  @override
  void initState() {
    super.initState();
    currentUser = User();
    if (currentUser.getPic() != null) _image = File(currentUser.getPic());
    print(currentUser.getFirstTime());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: k_boxDecorationGradient.copyWith(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue,
                    Colors.lightBlue,
                    Colors.lightBlueAccent,
                    Color(0xb3e5fc),
                  ],
                ),
              ),
            ),
            Hero(
              child: CustomAnimatedLogo(),
              tag: heroTag,
            ),
            Positioned(
              top: 300,
              left: 50,
              right: 50,
              child: Column(
                children: <Widget>[
                  TextField(
                    style: TextStyle(
                      fontSize: 24,
                    ),
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _emailTF = value;
                    },
                    decoration:
                        kInputDecoration.copyWith(hintText: 'Enter your email'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      _passwordTF = value;
                    },
                    decoration: kInputDecoration.copyWith(hintText: 'Password'),
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  CustomButton(
                    buttonText: 'Log In',
                    onPress: () async {
                      if (_isChecked == true &&
                          _emailTF != null &&
                          _passwordTF != null) {
                        //if recuerdame is checked and email and
                        // pass are not null save to SP
                        currentUser.setEmail(_emailTF);
                        currentUser.setPassword(_passwordTF);
                        await currentUser.persistData();
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        bool checkValue1 = prefs.containsKey('email');
                        bool checkValue2 = prefs.containsKey('password');

                        if (checkValue1 == true && checkValue2 == true)
                          print('saved!');
                        else
                          print('NOT saved');
                      }
                      setState(() {
                        _showSpinner = true;
                      });
//                  try {
//                    final user = await _auth.signInWithEmailAndPassword(
//                        email: _email.trim(), password: _password.trim());
//                    if (user != null) {
//                      currentUser.getFirstTime()
//                          ? Navigator.push(
//                              context,
//                              MaterialPageRoute(
//                                builder: (context) {
//                                  return InstructionsScreen();
//                                },
//                              ),
//                            )
//                          :
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenManager(
                            child: HomeScreen(),
                          ),
                        ),
                      );
//                    }
//                  } catch (e) {
//                    print(e);
//                  }
                      setState(() {
                        _showSpinner = false;
                      });
                    },
                    colour: Colors.lightBlueAccent,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Recuérdame',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Checkbox(
                        value: currentUser.remember,
                        activeColor: Colors.lightBlueAccent,
                        onChanged: (_isChecked) {
                          setState(() {
                            currentUser.toggleRemember();
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      //body: ,
    );
  }
}
