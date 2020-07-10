import 'side_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demoaqua/constants.dart';
import 'dart:math' as math;

class ScreenManager extends StatefulWidget {
  static const String id = 'main_screen';
  final Widget child;
  const ScreenManager({this.child});
//  const MainScreen({Key key, this.child}) : super(key: key);

  @override
  _ScreenManagerState createState() => _ScreenManagerState();
}

class _ScreenManagerState extends State<ScreenManager>
    with SingleTickerProviderStateMixin {
  static const _duration = Duration(milliseconds: 250);
  static const double _maxSlide = 300.0;
  static const double _minDragStartEdge = 60;
  static const double _maxDragStartEdge = _maxSlide - 16;

  AnimationController _animationController;
  bool _canBeDragged = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

//  void _toggle() => _animationController.isDismissed
//      ? _animationController.forward()
//      : _animationController.reverse();

  void _toggle() => _animationController.isCompleted ? close() : open();
  void close() => _animationController.reverse();
  void open() => _animationController.forward();

  void _onDragStart(DragStartDetails details) {
    bool _isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < _minDragStartEdge;
    bool _isDragCloseFromRight = _animationController.isDismissed &&
        details.globalPosition.dx > _maxDragStartEdge;

    _canBeDragged = _isDragOpenFromLeft || _isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta / _maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    double _kMinFlingVelocity = 365.0;

    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= _kMinFlingVelocity) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      _animationController.reverse();
    } else {
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, _) {
        return Material(
          child: Container(
            decoration: k_boxDecorationGradient,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.lightBlueAccent,
//                  decoration: Colors.grey,
                ),
                Transform.translate(
                  offset:
                      Offset(_maxSlide * (_animationController.value - 1), 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(math.pi / 2 * (1 - _animationController.value)),
                    alignment: Alignment.centerRight,
                    child: CustomSideMenu(),
                  ),
                ),
                Transform.translate(
                  offset: Offset(_maxSlide * _animationController.value - 1, 0),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(-math.pi * _animationController.value / 2),
                    alignment: Alignment.centerLeft,
                    child: SizedBox.expand(child: widget.child),
                  ),
                ),
                Positioned(
                  top: 4.0 + MediaQuery.of(context).padding.top,
                  left: 4.0 + _animationController.value * _maxSlide,
                  child: GestureDetector(
                    onTap: _toggle,
                    onHorizontalDragStart: _onDragStart,
                    onHorizontalDragUpdate: _onDragUpdate,
                    onHorizontalDragEnd: _onDragEnd,
                    behavior: HitTestBehavior.translucent,
                    child: IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: _toggle,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
//    );
  }
}
