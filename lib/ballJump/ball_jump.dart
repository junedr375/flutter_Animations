import 'package:flutter/material.dart';

class BallJump extends StatefulWidget {
  @override
  _BallJumpState createState() => _BallJumpState();
}

class _BallJumpState extends State<BallJump>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;

  Animation ballJumpUpAnimation;
  Animation ballJumpDownAnimation;

  bool isStarted = false;

  double ballJumbVal = 1.0;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);

    ballJumpUpAnimation = Tween<double>(begin: 0.0, end: -0.3).animate(
        CurvedAnimation(
            curve: Interval(0.0, 0.40, curve: Curves.ease),
            parent: animationController));
    ballJumpDownAnimation = Tween<double>(begin: -0.3, end: 0.0).animate(
        CurvedAnimation(
            curve: Interval(0.60, 1.0, curve: Curves.linear),
            parent: animationController));

    animationController.addListener(() {
      setState(() {
        if (animationController.value >= 0 &&
            animationController.value <= 0.40) {
          ballJumbVal = ballJumpUpAnimation.value;
        } else if (animationController.value >= 0.60 &&
            animationController.value <= 1.0) {
          ballJumbVal = ballJumpDownAnimation.value;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
              curve: Curves.bounceInOut,
              duration: Duration(seconds: 4),
              child: Center(
                child: Container(
                  height: height,
                  width: width / 4,
                  color: Colors.black,
                ),
              )),
          Positioned(
            left: width / 2 - 40.0,
            top: height / 2 - 100.0,
            child: Container(
              height: 40,
              width: 80,
              child: GestureDetector(
                onTap: () {
                  animationController.repeat();
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      border: Border.all(width: 2, color: Colors.green[900]),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: Text(
                      'JUMP',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child) {
                return Transform(
                    transform: Matrix4.translationValues(
                        0.0, height * ballJumbVal, 0.0),
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            // borderRadius: BorderRadius.circular(25),
                            color: Colors.grey,
                            shape: BoxShape.circle),
                      ),
                    ));
              })
        ],
      ),
    );
  }
}
