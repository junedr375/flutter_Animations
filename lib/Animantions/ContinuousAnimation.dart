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
        AnimationController(duration: Duration(seconds: 6), vsync: this);

    animation = IntTween(begin: 3, end: 10).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
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
                  height: 20.0 * animation.value,
                  width: 20.0 * animation.value,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius:
                          BorderRadius.circular((20.0 * animation.value) / 2)),
                )
              ],
            ),
          ),
        ));
      },
    );
  }
}
