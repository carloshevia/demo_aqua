import 'package:demoaqua/authentication_screens/welcome_screen.dart';
import 'package:demoaqua/constants.dart';
import 'package:demoaqua/screens/instrucciones_screen.dart';
import 'package:demoaqua/screens/settings_screen.dart';
import 'home_screen.dart';
import 'screen_manager.dart';
import 'single_play_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:demoaqua/logic/user_class.dart';
import 'dart:io';

class CustomSideMenu extends StatelessWidget {
  final User currentUser = User();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: double.infinity,
      child: Material(
        color: Colors.blue,
        child: Container(
          decoration: k_questionsDecoration,
          child: Theme(
            data: ThemeData(brightness: Brightness.dark),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.all(40),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: currentUser.getPic() == null
                        ? Hero(
                            tag: 'pic',
                            child: CircleAvatar(
                              radius: 50,
                              child: Icon(
                                Icons.person,
                              ),
                            ),
                          )
                        : Hero(
                            tag: 'pic',
                            child: CircleAvatar(
                              radius: 50,
                              backgroundImage: FileImage(
                                File(currentUser.getPic()),
                              ),
                            ),
                          ),
                  ),
                ),
                Divider(
                  thickness: 3.0,
                  indent: 25,
                  endIndent: 25,
                ),
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.home),
                    onPressed: () {
                      print('Home');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenManager(
                            child: HomeScreen(),
                          ),
                        ),
                      );
                    },
                  ),
                  title: Text(
                    'Home',
                    style: k_textStyleSideMenu,
                  ),
                ),
//                ListTile(
//                  leading: IconButton(
//                    icon: Icon(Icons.map),
//                    onPressed: () {
//                      print('Map');
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => ScreenManager(
//                            child: MapScreen(),
//                          ),
//                        ),
//                      );
//                    },
//                  ),
//                  title: Text(
//                    'Map',
//                    style: k_textStyleSideMenu,
//                  ),
//                ),
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.chat),
                    onPressed: () {
                      print('Chat');
//                      Navigator.push(
//                        context,
//                        MaterialPageRoute(
//                          builder: (context) => MainScreen(
//                            child: MapScreen(),
//                          ),
//                        ),
//                      );
                    },
                  ),
                  title: Text(
                    'Chat',
                    style: k_textStyleSideMenu,
                  ),
                ),
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.help),
                    onPressed: () {
                      print('Help');
                      Navigator.pushNamed(context, InstructionsScreen.id);
                    },
                  ),
                  title: Text(
                    'Help',
                    style: k_textStyleSideMenu,
                  ),
                ),
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: () {
                      print('Settings');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ScreenManager(
                            child: SettingsScreen(),
                          ),
                        ),
                      );
                    },
                  ),
                  title: Text(
                    'Settings',
                    style: k_textStyleSideMenu,
                  ),
                ),
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.time_to_leave),
                    onPressed: () async {
                      if (currentUser.remember != true) {
                        print('currentUser.remember ${currentUser.remember}');
                        print('removing SP data');
                        await currentUser.removeData();
                      }
//                      _auth.signOut();
                      Navigator.pushNamedAndRemoveUntil(
                          context, WelcomeScreen.id, (route) => false);
                    },
                  ),
                  title: Text(
                    'Log out',
                    style: k_textStyleSideMenu,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
