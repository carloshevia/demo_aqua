import 'package:flutter/material.dart';

class StepQuestion extends StatelessWidget {
  final String question;

  const StepQuestion({Key key, @required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64, right: 16),
      child: Container(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                question,
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Plane extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 32.0 + 8,
      top: 32,
      child: RotatedBox(
        quarterTurns: 2,
        child: Icon(
          Icons.place,
          size: 64,
          color: Colors.white,
        ),
      ),
    );
  }
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 32.0 + 32 + 8,
      top: 40,
      bottom: 0,
      width: 1,
      child: Container(color: Colors.white.withOpacity(0.5)),
    );
  }
}

class Dot extends StatelessWidget {
  final bool visible;

  const Dot({Key key, this.visible = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: visible ? Colors.white : Colors.transparent,
      ),
    );
  }
}

class StepNumber extends StatelessWidget {
  final int number;

  const StepNumber({Key key, @required this.number}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 64, right: 16),
      child: Text(
        '0$number',
        style: TextStyle(
          fontSize: 64,
          fontWeight: FontWeight.bold,
          color: Colors.white.withOpacity(0.5),
        ),
      ),
    );
  }
}
