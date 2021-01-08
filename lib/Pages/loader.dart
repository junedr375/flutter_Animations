import 'dart:math';

import 'package:flutter/material.dart';

class MyLoader extends StatefulWidget {
  @override
  _MyLoaderState createState() => _MyLoaderState();
}

class _MyLoaderState extends State<MyLoader>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Animation<double> animation_rotaion;
  Animation<double> animation_radius_in;
  Animation<double> animation_radius_out;

  final double initialRadius = 40;
  double radius = 0.0;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation_rotaion = Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.0, 1.0, curve: Curves.linear)));

    animation_radius_in = Tween<double>(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.75, 1.0, curve: Curves.elasticIn)));
    animation_radius_out = Tween<double>(begin: 0.0, end: 0.1).animate(
        CurvedAnimation(
            parent: animationController,
            curve: Interval(0.0, 0.25, curve: Curves.elasticOut)));
    animationController.addListener(() {
      setState(() {
        if (animationController.value >= 0.75 &&
            animationController.value <= 1.0) {
          radius = animation_radius_in.value * initialRadius;
        } else if (animationController.value >= 0.0 &&
            animationController.value <= 0.25) {
          radius = animation_radius_out.value * initialRadius;
        }
      });
    });
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
      width: 100,
      height: 100,
      child: Center(
        child: RotationTransition(
          turns: animation_rotaion,
          child: Stack(
            children: [
              Dot(radius: 20, color: Colors.black12),
              Transform.translate(
                offset: Offset(radius * cos(pi / 4), radius * sin(pi / 4)),
                child: Dot(radius: 8, color: Colors.redAccent),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(2 * pi / 4), radius * sin(2 * pi / 4)),
                child: Dot(radius: 8, color: Colors.redAccent),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(3 * pi / 4), radius * sin(3 * pi / 4)),
                child: Dot(radius: 8, color: Colors.redAccent),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(4 * pi / 4), radius * sin(4 * pi / 4)),
                child: Dot(radius: 8, color: Colors.redAccent),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(5 * pi / 4), radius * sin(5 * pi / 4)),
                child: Dot(radius: 8, color: Colors.redAccent),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(6 * pi / 4), radius * sin(6 * pi / 4)),
                child: Dot(radius: 8, color: Colors.redAccent),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(7 * pi / 4), radius * sin(7 * pi / 4)),
                child: Dot(radius: 8, color: Colors.redAccent),
              ),
              Transform.translate(
                offset:
                    Offset(radius * cos(8 * pi / 4), radius * sin(8 * pi / 4)),
                child: Dot(radius: 8, color: Colors.redAccent),
              ),
            ],
          ),
        ),
      ),
    )));
  }
}

class Dot extends StatelessWidget {
  final double radius;
  final Color color;
  Dot({this.radius, this.color});
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: this.radius,
      height: this.radius,
      decoration: BoxDecoration(color: this.color, shape: BoxShape.circle),
    ));
  }
}
