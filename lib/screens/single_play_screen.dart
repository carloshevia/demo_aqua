import 'package:demoaqua/constants.dart';
import 'package:demoaqua/custom_widgets/custom_chart.dart';
import 'package:demoaqua/custom_widgets/custom_chart_tutorial.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../custom_widgets/custom_botton.dart';
import '../custom_widgets/custom_path.dart';
import '../questions_screens/questions_screen.dart';
import 'package:demoaqua/example.dart';

class SinglePlayerScreen extends StatefulWidget {
  static const String id = 'single_playerer_screen';

  @override
  _SinglePlayerScreenState createState() => _SinglePlayerScreenState();
}

class _SinglePlayerScreenState extends State<SinglePlayerScreen> {
  int maxRow = 3;
  int maxCol = 3;
  Image _image = Image.asset('images/map1.jpg');
  Size size = Size.fromWidth(300);
  static Example example = Example();
  List<CustomChart> graphList = [
    CustomChart(data: example.getInitExample, chartType: 1),
    CustomChart(data: example.getInitExample, chartType: 3),
  ];

  List<Widget> getPieces() {
    List<Widget> pieces = List<Widget>();
    for (int x = 0; x < maxRow; x++) {
      for (int y = 0; y < maxCol; y++) {
        CustomClipPath piece = splitImage(x, y);
        pieces.add(piece ?? Text('ERROR: NULL'));
      }
    }
    return pieces;
  }

  CustomClipPath splitImage(int x, int y) {
    CustomClipPath piece = CustomClipPath(
        image: _image,
        imageSize: size,
        row: x,
        col: y,
        maxRow: maxRow,
        maxCol: maxCol);
    return piece;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: k_boxDecorationGradient,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 75,
            ),
            Text(
              'NAME OF THE GAME',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
            Text(
              'Single Player Mode',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: CustomButton(
                buttonText: 'Play',
                colour: Colors.blue,
                onPress: () => Navigator.pushNamed(context, QuestionsScreen.id),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(7),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Row(
//                        mainAxisSize: ,
                        children: <Widget>[
                          SizedBox(
                            height: 300,
                            width: 300,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: graphList.length,
                              itemBuilder: (context, index) => Container(
                                child: graphList[index],
                                width: MediaQuery.of(context).size.width * 0.8,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //********PIECES MAP**************
//      Container(
//      decoration: k_boxDecorationGradient,
//      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
//        children: <Widget>[
//          Stack(
//            children: getPieces(),
//          ),
//          SizedBox(
//            height: 25,
//          ),
//          SizedBox(
//            height: 30,
//          ),
//          CustomButton(
//            buttonText: 'Play',
//            onPress: () {
//              print(_image.height);
//              print('ok');
//              Navigator.push(
//                context,
//                MaterialPageRoute(builder: (context) => QuestionsScreen()),
//              );
//            },
//            colour: Colors.lightBlueAccent,
//          ),
//        ],
//      ),
//    );
          ],
        ),
      ),
    );
  }
}
