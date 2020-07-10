import 'package:demoaqua/custom_widgets/custom_animatedLogo.dart';
import 'package:demoaqua/custom_widgets/custom_botton.dart';
import 'package:demoaqua/custom_widgets/custom_chart.dart';
import 'package:demoaqua/questions_screens/questions_screen.dart';
import 'package:demoaqua/screens/single_play_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demoaqua/constants.dart';
import 'package:flutter/widgets.dart';
import '../logic/user_class.dart';
import 'dart:io';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User currentUser = User();
  String heroTag = 'logoTag';

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: k_boxDecorationGradient,
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(80),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    currentUser.getName() != null
                        ? currentUser.getName()
                        : 'Jhon Doe',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Hero(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  child: CustomAnimatedLogo(),
                ),
                tag: heroTag,
              ),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CustomButton(
                  buttonText: "Single Play",
                  colour: Colors.blueAccent,
                  onPress: () =>
                      Navigator.pushNamed(context, SinglePlayerScreen.id),
                ),
                CustomButton(
                  buttonText: "Multiplayer Play",
                  colour: Colors.blue,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
