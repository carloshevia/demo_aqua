import 'package:demoaqua/questions_screens/questions_screen.dart';
import 'package:demoaqua/screens/home_screen.dart';
import 'package:demoaqua/screens/instrucciones_screen.dart';
import 'package:demoaqua/screens/single_play_screen.dart';
import 'package:flutter/material.dart';
import 'authentication_screens/login_screen.dart';
import 'authentication_screens/welcome_screen.dart';
import 'screens/screen_manager.dart';
import 'authentication_screens/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'logic/user_class.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  User currentUser = User();
  currentUser.setEmail(prefs.getString('email')); // retrieve email
  currentUser.setPassword(prefs.getString('password')); // retrieve password
  currentUser.setPic(prefs.getString('picture')); // retrieve pic
  currentUser
      .setFirstTime(prefs.getBool('FirstTimeUser')); // retrieve firstTimeUser
  bool isLoggedIn =
      currentUser.getEmail() != null && currentUser.getPass() != null
          ? true
          : false;
  currentUser.setLoggIn(isLoggedIn);
//  print('currentUser.getEmail: ${currentUser.getEmail()}');
//  print('currentUser.getPassword: ${currentUser.getPass()}');
//  print('currentUser.getPic: ${currentUser.getPic()}');
//  print('getLoggIn: ${currentUser.getLoggIn()}');
  runApp(MyApp(loggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  MyApp({this.loggedIn = false});
  final bool loggedIn;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => User(),
      child: MaterialApp(
        //the initial screen of the app
        home: !loggedIn
            ? WelcomeScreen()
            : ScreenManager(
                child: HomeScreen(),
              ),
        routes: {
          RegistrationScreen.id: (context) => RegistrationScreen(),
          LoginScreen.id: (context) => LoginScreen(),
          ScreenManager.id: (context) => ScreenManager(),
          WelcomeScreen.id: (context) => WelcomeScreen(),
          InstructionsScreen.id: (context) => InstructionsScreen(),
          SinglePlayerScreen.id: (context) => SinglePlayerScreen(),
          QuestionsScreen.id: (context) => QuestionsScreen(),
        },
      ),
    );
  }
}
