import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User extends ChangeNotifier {
  User({this.remember = false});

  static bool firstTime;
  static bool _isLoggedIn;
  static String _name;
  static String _email;
  static String _password;
  static String _profilePic;
  bool remember;

  bool getFirstTime() {
    return firstTime;
  }

  Future<void> loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _password = await prefs.getString('password') ?? '';
    _email = await prefs.getString('email') ?? '';
    _profilePic = await prefs.getString('picture');

    notifyListeners();
  }

  Future<void> removeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('password');
    await prefs.remove('picture');
    reset();
    notifyListeners();
  }

  Future<void> persistData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_email != null && _password != null) {
      await prefs.setString('email', _email);
      await prefs.setString('password', _password);
      if (_profilePic != null) await prefs.setString('picture', _profilePic);
    }
  }

  void reset() {
    _email = null;
    _password = null;
    _profilePic = null;
    _isLoggedIn = false;
    remember = false;
  }

  void toggleRemember() {
    remember = !remember;
  }

  //  File image;
  String getName() {
    return _name;
  }

  String getEmail() {
    return _email;
  }

  String getPass() {
    return _password;
  }

  String getPic() {
    return _profilePic;
  }

  bool getLoggIn() {
    return _isLoggedIn;
  }

  void setFirstTime(bool firstTimeUser) {
    firstTime = firstTimeUser;
  }

  void setEmail(String email) {
    _email = email;
  }

  void setPassword(String password) {
    _password = password;
  }

  void setPic(String profilePic) {
    _profilePic = profilePic;
  }

  void setLoggIn(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
  }
}
