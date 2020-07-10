import 'dart:ui';

import 'package:demoaqua/custom_widgets/custom_animatedLogo.dart';
import 'package:demoaqua/custom_widgets/custom_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:demoaqua/custom_widgets/custom_botton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:demoaqua/constants.dart';
import 'package:demoaqua/logic/user_class.dart';
import 'dart:io';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String heroTag = 'logoTag';
  User currentUser = User();
  final picker = ImagePicker();
  File image;
  bool showPass = false;

  Future getImage() async {
    PickedFile pickedFile = await picker.getImage(source: ImageSource.gallery);
    image = File(pickedFile.path);
    Directory dir = await getApplicationDocumentsDirectory();
    final String path = dir.uri.resolve("pic.jpg").path;
    final File newImage = await image.copy(path);
    currentUser.setPic(newImage.path);

    imageCache.clear();
    setState(() {
      image = File(currentUser.getPic());
    });
    imageCache.clearLiveImages();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: k_boxDecorationGradient,
      child: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: <Widget>[
            Container(
              child: CustomAnimatedLogo(),
              height: 200,
              width: 200,
            ),
            Flexible(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CustomCard(
                      title: 'Jhon Doe',
                      leadIcon: image == null
                          ? k_imgAlt
                          : CircleAvatar(
                              backgroundImage: FileImage(
                                image,
                              ),
                            ),
                      widgetsList: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 10, bottom: 2),
                          child: Text('Actualizar Foto'),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                getImage();
                              });
                            },
                            child: image == null
                                ? CircleAvatar(
                                    radius: 50,
                                    child: Icon(
                                      Icons.person,
                                    ),
                                  )
                                : CircleAvatar(
                                    radius: 50,
                                    backgroundImage: FileImage(
                                      image,
                                    ),
                                  ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 10, bottom: 2),
                          child: Text('Actualizar Nombre'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 2, bottom: 10),
                          child: TextField(
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              print(value);
                            },
                            decoration: kInputDecoration,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 10, bottom: 2),
                          child: Text('Actualizar Apellido'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 2, bottom: 10),
                          child: TextField(
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              print(value);
                            },
                            decoration: kInputDecoration,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: CustomButton(
                            buttonText: 'Actualizar',
                            onPress: () => print('ok'),
                            colour: Colors.blue,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    CustomCard(
                      title: 'Change Email',
                      leadIcon: Icon(
                        Icons.email,
                        size: 40,
                        color: Colors.blue,
                      ),
                      widgetsList: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 10, bottom: 2),
                          child: Text('Actualizar Email'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 2, bottom: 10),
                          child: TextField(
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            keyboardType: TextInputType.emailAddress,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              print(value);
                            },
                            decoration: kInputDecoration,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: CustomButton(
                            buttonText: 'Actualizar',
                            onPress: () => print('ok'),
                            colour: Colors.blue,
                          ),
                        )
                      ],
                    ),
                    CustomCard(
                      title: 'Change Password',
                      leadIcon: Icon(
                        Icons.lock_outline,
                        size: 40,
                        color: Colors.blue,
                      ),
                      widgetsList: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 10, bottom: 2),
                          child: Text('Actualizar Password'),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 5, right: 5, top: 2, bottom: 5),
                          child: TextField(
                            style: TextStyle(
                              fontSize: 20,
                            ),
                            obscureText: !showPass ? true : false,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              print(value);
                            },
                            decoration: kInputDecoration,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'Show Password',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.blue,
                              ),
                            ),
                            Checkbox(
                              value: showPass,
                              activeColor: Colors.lightBlueAccent,
                              onChanged: (_isChecked) {
                                setState(() {
                                  showPass = !showPass;
                                });
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: CustomButton(
                            buttonText: 'Actualizar',
                            onPress: () => print('ok'),
                            colour: Colors.blue,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
