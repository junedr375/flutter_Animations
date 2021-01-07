import 'package:flutter/material.dart';

class ContinuousAnimation extends StatefulWidget {
  @override
  _ContinuousAnimationState createState() => _ContinuousAnimationState();
}

class _ContinuousAnimationState extends State<ContinuousAnimation>
    with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    animation = IntTween(begin: 3, end: 8).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear))
      ..addListener(() {
        if (animationController.isCompleted) {
          animationController.reverse();
        }
      });
    animationController.forward();
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final double size = 20.0;
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return Scaffold(
            body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Loading...'),
                //Text(animation.value.toString(), style: TextStyle(fontSize: 52)),
                Container(
                  height: size * animation.value,
                  width: size * animation.value,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(
                          (size * animation.value) / 2.0)),
                  transform: Matrix4.translationValues(
                      size * animation.value, size * animation.value, 0.0),
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}
