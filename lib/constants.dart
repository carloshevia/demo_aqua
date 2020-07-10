import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

const k_color_water = Color(0xFF254F68);

List<charts.Color> chart_colors = [
  charts.ColorUtil.fromDartColor(Colors.blue),
  charts.ColorUtil.fromDartColor(Colors.tealAccent),
  charts.ColorUtil.fromDartColor(Colors.teal),
  charts.ColorUtil.fromDartColor(Colors.deepPurpleAccent),
  charts.ColorUtil.fromDartColor(Colors.purpleAccent),
  charts.ColorUtil.fromDartColor(Colors.red),
  charts.ColorUtil.fromDartColor(Colors.pinkAccent),
  charts.ColorUtil.fromDartColor(Colors.orange),
  charts.ColorUtil.fromDartColor(Colors.amberAccent),
  charts.ColorUtil.fromDartColor(Colors.yellow),
  charts.ColorUtil.fromDartColor(Colors.green),
  charts.ColorUtil.fromDartColor(Colors.lightGreenAccent),
  charts.ColorUtil.fromDartColor(Colors.blueGrey),
  charts.ColorUtil.fromDartColor(Colors.grey),
  charts.ColorUtil.fromDartColor(Colors.brown),
  charts.ColorUtil.fromDartColor(Colors.black),
];

const Map<String, String> k_mapShortODS = {
  'MPI':
      'Share of population with access to sufficient water and sanitation services',
  'RYD': 'Reduccion of agricultural yields during drought conditions',
  'AAP': 'Average agricultural production (Ton/yr)',
  'PAC': 'Productive agricultural lands without land use conflict (Ha)',
  'SWR':
      'Share of total irrigation from water sources with sanitary or toxicity risk',
  'HWD': 'Household water demands coverage (%)',
  'WWT': 'Proportion of waste water safely treated',
  'PWQ': 'Proportion of bodies of water with good ambient water quality',
  'CWT': 'Change in water-use efficiency over time',
  'SES': 'Share of electricity sources from local sustainable sources',
  'OWR': 'Organic solid waste recovery (%)',
  'PWD': 'Proportion of solid waste properly disposed (%)',
  'AWD':
      'Total areas destined for sold water disposal in landfills (Ha/yr)     ',
  'SSA': 'Share of local supply of agricultural products in total consumption',
  'WSL': 'Water supply from local source',
  'PDL':
      'Percentage of areas with degraded land cover, or in process of degradation (%)',
  'OS': 'Overall score'
};

const kInputDecoration = InputDecoration(
  hintStyle: k_textFieldsStyle,
  hintText: 'Enter value',
  fillColor: Colors.white,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(22.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(22.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(22.0)),
  ),
);

const k_boxDecorationGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1, 0.2, 0.4, 1],
    colors: [
      Colors.blue,
      Colors.lightBlue,
      Colors.lightBlueAccent,
      Colors.white70,
    ],
  ),
);

const k_questionsDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [
      Colors.blue,
      Colors.blueAccent,
      Colors.lightBlue,
      Colors.lightBlueAccent,
      Colors.white,
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomRight,
  ),
);

const k_gradientAppBar = LinearGradient(
  begin: Alignment.bottomRight,
  end: Alignment.topLeft,
  colors: [
    Color(0xb3e5fc),
    Colors.lightBlueAccent,
    Colors.lightBlue,
    Colors.blue,
  ],
);

const k_textFieldsStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);

const k_textStyleSideMenu = TextStyle(
  fontSize: 30,
  color: Colors.white,
);

const k_imgAlt = CircleAvatar(
  child: Icon(
    Icons.person,
  ),
);

const k_imgAlt_Rad50 = CircleAvatar(
  radius: 50,
  child: Icon(
    Icons.person,
  ),
);

const kSendButtonTextStyle = TextStyle(
  color: Colors.lightBlueAccent,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);

const kMessageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);
