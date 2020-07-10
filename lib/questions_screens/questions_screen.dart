import 'package:flutter/material.dart';
import '../constants.dart';
import 'questions_screen_helper.dart';
import 'questions_screen_page.dart';

class QuestionsScreen extends StatefulWidget {
  static String id = 'questions_screen';
  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int idx;
  int size;

  @override
  void initState() {
    size = 2;
    idx = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> db = [
      PageCustom(
        key: Key('page1'),
        onOptionSelected: () {
          idx == size - 1 ? idx = 0 : idx++;
          setState(() {});
        },
        question:
            'Juan convenció a un vecino de realizar una quema del 20ha de su bosque, pues así podría cultivar y generar un nuevo ingreso. Por lo que las entidades regionales le cobraran multas de: 1. La corporación ambiental por daños en bosque 2. La alcaldía xxlitros, articulo de la policía.xxlitros por quema de bosque. 3.Comunidad xx litros, daños a sus vecinos. Tu puedes ayudar al campesino a recuperar sus litros de agua y a generar una acción para ayudar su terreno, escogiendo:',
        answers: <String>[
          'Siembra 15 ha',
          'Reforestación 15 ha',
        ],
        number: 1,
      ),
      PageCustom(
        key: Key('page2'),
        onOptionSelected: () {
          idx == size - 1 ? idx = 0 : idx++;
          setState(() {});
        },
        question:
            'Don Efrain el ingeniero de la región en su afán de  aumentar la producción aumento su cantidad de ganado, lo que genero sobrepastoreo en sus terrenos. Cortolima en su función de control al ver las afectaciones los multo con 30lts.Tu puedes ayudar a Don Efrain a recuperar sus litros de agua y a generar una acción para ayudar su terreno, escogiendo:',
        answers: <String>[
          'Reforestar 10% de sus terrenos',
          'Incremento del 60% de la produccion',
        ],
        number: 2,
      )
    ];

    Widget page = db[idx];

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: k_questionsDecoration,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              Plane(),
              Line(),
              Positioned.fill(
                left: 32.0 + 8,
                child: AnimatedSwitcher(
                  child: page,
                  duration: Duration(milliseconds: 250),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
