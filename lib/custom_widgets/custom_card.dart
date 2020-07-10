import 'package:flutter/material.dart';
import 'package:demoaqua/constants.dart';
import 'custom_botton.dart';

class CustomCard extends StatelessWidget {
  CustomCard({this.title, this.leadIcon, this.widgetsList});

  final String title;
  final Widget leadIcon;
  final List<Widget> widgetsList;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      color: Colors.white,
      child: ExpansionTile(
        leading: leadIcon,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        trailing: Icon(Icons.edit),
        children: widgetsList,
      ),
    );
  }
}
