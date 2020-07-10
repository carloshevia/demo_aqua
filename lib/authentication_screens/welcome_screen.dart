import 'package:demoaqua/custom_widgets/custom_animatedLogo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';
import '../custom_widgets/custom_botton.dart';
import '../authentication_screens/login_screen.dart';
import '../authentication_screens/registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  //TODO screen id
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String heroTag = 'logoTag';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: k_boxDecorationGradient,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Text(
                    'Titulo',
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ),
                Hero(
                  child: CustomAnimatedLogo(),
                  tag: heroTag,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    children: <Widget>[
                      CustomButton(
                        buttonText: 'Log In',
                        onPress: () {
                          Navigator.pushNamed(context, LoginScreen.id);
                        },
                        colour: Colors.lightBlueAccent,
                      ),
                      CustomButton(
                        buttonText: 'Register',
                        onPress: () {
                          Navigator.pushNamed(context, RegistrationScreen.id);
                        },
                        colour: Colors.blueAccent,
                      ),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
