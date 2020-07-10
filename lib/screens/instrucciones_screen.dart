import 'package:demoaqua/custom_widgets/custom_botton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demoaqua/constants.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import '../logic/user_class.dart';
import 'package:demoaqua/screens/screen_manager.dart';
import 'package:demoaqua/screens/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:demoaqua/custom_widgets/custom_card.dart';

class InstructionsScreen extends StatefulWidget {
  static const String id = 'instructions_screen';

  @override
  _InstructionsScreenState createState() => _InstructionsScreenState();
}

class _InstructionsScreenState extends State<InstructionsScreen> {
  final User currentUser = User();
  String heroTag = 'logoTag';
  String instructions;

  // Open text file with instructions
  Future<String> loadAsset(BuildContext context) async {
    final instr = await DefaultAssetBundle.of(context)
        .loadString('assets/instrucciones.txt');
    setState(() {
      instructions = instr;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadAsset(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 30, left: 5, right: 5, bottom: 5),
        decoration: k_boxDecorationGradient,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'INSTRUCCIONES',
                style: k_textStyleSideMenu,
              ),
            ),
            Flexible(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        // if null display error msg
                        instructions ?? 'ERROR: NULL',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CustomCard(
              title: 'ASIGNAR PRIORIDADES',
              leadIcon: Icon(
                Icons.priority_high,
                size: 40,
                color: Colors.blue,
              ),
              widgetsList: <Widget>[
                Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text(
                      'Estrategia 1',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    title: Text(
                      'Titulo de la estrategia',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    trailing: DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text('1'),
                        ),
                      ],
                      onChanged: (null),
                    ),
                  ),
                ),
                Container(
                  color: Colors.white,
                  child: ListTile(
                    leading: Text(
                      'Estrategia 2',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    title: Text(
                      'Titulo de la estrategia',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                    trailing: DropdownButton(
                      items: [
                        DropdownMenuItem(
                          child: Text('1'),
                        ),
                      ],
                      onChanged: (null),
                    ),
                  ),
                ),
                CustomButton(
                  buttonText: 'Play!',
                  colour: Colors.lightBlue,
                  onPress: () async {
                    currentUser.setFirstTime(false);
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                    await prefs.setBool('FirstTimeUser', false);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScreenManager(
                          child: HomeScreen(),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
