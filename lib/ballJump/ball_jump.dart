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
  Animation boxAnimation;

  bool isStarted = false;

  double ballJumbVal = 1.0;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        duration: Duration(milliseconds: 2000), vsync: this);

    boxAnimation = Tween<double>(begin: 1.0, end: -1.0).animate(
        CurvedAnimation(curve: Curves.linear, parent: animationController));

    ballJumpUpAnimation = Tween<double>(begin: 0.0, end: -0.8).animate(
        CurvedAnimation(
            curve: Interval(0.0, 0.40, curve: Curves.ease),
            parent: animationController));
    ballJumpDownAnimation = Tween<double>(begin: -0.8, end: 0.0).animate(
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
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Container(
              height: height,
              width: width / 4,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(45)),
            ),
          ),
          AnimatedBuilder(
              animation: animationController,
              builder: (BuildContext context, Widget child) {
                return Transform(
                  transform: Matrix4.translationValues(
                      0.0, height * boxAnimation.value, 0.0),
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          height: height,
                          width: width / 4,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(45)),
                        ),
                        Positioned(
                          top: 50,
                          left: 20,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 120,
                          left: 80,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.yellow, shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 280,
                          left: 35,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.yellow, shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 230,
                          left: 60,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.pink, shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 330,
                          left: 80,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 430,
                          left: 10,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 480,
                          left: 20,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.blue, shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 410,
                          left: 40,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white, shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 110,
                          left: 5,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.orange, shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 1,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.yellow[900],
                                shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 150,
                          left: 1,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.purple[900],
                                shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 220,
                          left: -10,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.white30, shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 320,
                          left: -10,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.green, shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 530,
                          left: 64,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 630,
                          left: 24,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.purple, shape: BoxShape.circle),
                          ),
                        ),
                        Positioned(
                          top: 660,
                          left: 74,
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                                color: Colors.orange, shape: BoxShape.circle),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
          Positioned(
              left: width / 2 - 40.0,
              top: height / 2 - 100.0,
              child: !isStarted
                  ? Container(
                      height: 40,
                      width: 80,
                      child: GestureDetector(
                        onTap: () {
                          animationController.repeat();
                          setState(() {
                            isStarted = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.greenAccent,
                              border: Border.all(
                                  width: 2, color: Colors.green[900]),
                              borderRadius: BorderRadius.circular(20)),
                          child: Center(
                            child: Text(
                              'JUMP',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container()),
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
