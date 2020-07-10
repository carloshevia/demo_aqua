import 'package:demoaqua/authentication_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import '../constants.dart';
import '../custom_widgets/custom_botton.dart';
import 'package:path_provider/path_provider.dart';
import '../logic/user_class.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  final picker = ImagePicker();
  User currentUser = User();
  File _image;
  Image imageFromPreferences;
  String _email;
  String _password;
  bool showSpinner = false;

  Future getImage() async {
    PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);
    _image = File(pickedFile.path);
    Directory dir = await getApplicationDocumentsDirectory();
    final String path = dir.uri.resolve("pic.jpg").path;
    final File newImage = await _image.copy(path);
    currentUser.setPic(newImage.path);

    imageCache.clear();
    setState(() {
      _image = File(currentUser.getPic());
    });
    imageCache.clearLiveImages();
  }

  @override
  void initState() {
    super.initState();
    if (currentUser.getPic() != null) _image = File(currentUser.getPic());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  setState(() {
                    getImage();
                  });
                },
                child: _image == null
                    ? k_imgAlt_Rad50
                    : CircleAvatar(
                        radius: 50,
                        backgroundImage: FileImage(
                          _image,
                        ),
                      ),
              ),
              SizedBox(
                height: 24,
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _email = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your email'),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                style: TextStyle(
                  fontSize: 20,
                ),
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  _password = value;
                },
                decoration:
                    kInputDecoration.copyWith(hintText: 'Enter your password.'),
              ),
              SizedBox(
                height: 24.0,
              ),
              CustomButton(
                buttonText: 'Register',
                onPress: () async {
                  setState(() {
                    showSpinner = true;
                  });
//                  try {
//                    final newUser = await _auth.createUserWithEmailAndPassword(
//                        email: email.trim(), password: password.trim());
//                    if (newUser != null) {

                  // to direct to instructions screen first time
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('FirstTimeUser', true);
                  currentUser.setFirstTime(true);

                  Navigator.pushNamed(context, LoginScreen.id);
//                    }
//                  } catch (e) {
//                    print(e);
//                  }
                  setState(() {
                    showSpinner = false;
                  });
                },
                colour: Colors.blueAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
