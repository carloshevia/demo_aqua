import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class CustomAnimatedLogo extends StatefulWidget {
  @override
  _CustomAnimatedLogoState createState() => _CustomAnimatedLogoState();
}

class _CustomAnimatedLogoState extends State<CustomAnimatedLogo> {
  bool toggleAnimation = true;
  void toggleAnimationFct() {
    setState(() {
      toggleAnimation = !toggleAnimation;
    });
    print(toggleAnimation);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 300,
        width: 300,
        child: GestureDetector(
          onTap: toggleAnimationFct,
          child: FlareActor(
            "assets/water.flr",
            fit: BoxFit.scaleDown,
            isPaused: toggleAnimation,
            animation: "Untitled",
            sizeFromArtboard: false,
          ),
        ),
      ),
    );
  }
}
