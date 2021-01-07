import 'dart:math';

import 'package:flutter/material.dart';

class MyToggleButton extends StatefulWidget {
  @override
  _MyToggleButtonState createState() => _MyToggleButtonState();
}

class _MyToggleButtonState extends State<MyToggleButton>
    with SingleTickerProviderStateMixin {
  bool toggleVal = false;
  AnimationController animationController;
  Animation animation;
  Animation rotateAnimation;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 300), vsync: this);
    animation = Tween(begin: -0.12, end: 0.120).animate(
        CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    rotateAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Center(
          child: GestureDetector(
            onTap: () {
              if (!toggleVal) {
                animationController.forward();
              } else {
                animationController.reverse();
              }
              setState(() {
                toggleVal = !toggleVal;
              });
            },
            child: Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                  color: toggleVal ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(25)),
              child: Container(
                child: RotationTransition(
                  turns: rotateAnimation,
                  child: toggleVal
                      ? Icon(
                          Icons.check_circle,
                          color: Colors.white,
                          size: 30,
                        )
                      : Icon(
                          Icons.check_circle_outline,
                          color: Colors.white,
                          size: 30,
                        ),
                ),
                transform: Matrix4.translationValues(
                    width * animation.value, 0.0, 0.0),
              ),
            ),
          ),
        );
      },
    ));
  }
}
