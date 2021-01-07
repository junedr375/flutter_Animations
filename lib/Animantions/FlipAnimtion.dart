import 'dart:math';

import 'package:flutter/material.dart';

class FLipAnimation extends StatefulWidget {
  @override
  _FLipAnimationState createState() => _FLipAnimationState();
}

class _FLipAnimationState extends State<FLipAnimation>
    with SingleTickerProviderStateMixin {
  Animation flip_anim;
  Animation heart_anim;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    flip_anim = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.0, 0.5, curve: Curves.linear)));
    heart_anim = Tween(begin: 2.0, end: 5.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.2, 0.5, curve: Curves.linear)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Center(
              child: InkWell(
            onTap: () {
              animationController.repeat();
            },
            child: Container(
              height: 200.0,
              width: 200.0,
              child: Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2,
                      0.008) // THIs to set Entry at specific postion so animation changes
                  ..rotateY(2 * pi * flip_anim.value), // to rotate along Y axis
                alignment: Alignment.center,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(100)),
                  child: RotationTransition(
                    // to rotate
                    turns: flip_anim,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30 * heart_anim.value,
                    ),
                  ),
                ),
              ),
            ),
          ));
        },
      ),
    );
  }
}
