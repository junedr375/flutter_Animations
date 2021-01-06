import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  Animation animation, delayedAnimation, muchDelayedAnimation;
  AnimationController animationController;
  String username;
  String password;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);

    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));

    delayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve: Curves.fastOutSlowIn)));

    muchDelayedAnimation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve: Curves.fastOutSlowIn)));

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: ListView(children: [
              SizedBox(height: height * 0.30),
              Transform(
                transform: Matrix4.translationValues(
                    animation.value * width, 0.0, 0.0),
                child: Container(
                    child: Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                )),
              ),
              SizedBox(height: 20),
              Transform(
                transform: Matrix4.translationValues(
                    delayedAnimation.value * width, 0.0, 0.0),
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Username'),
                        onChanged: (val) {
                          setState(() {
                            username = val;
                          });
                        },
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      height: 40,
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        decoration: InputDecoration(hintText: 'Password'),
                        onChanged: (val) {
                          setState(() {
                            password = val;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Transform(
                  transform: Matrix4.translationValues(
                      muchDelayedAnimation.value * width, 0.0, 0.0),
                  child: GestureDetector(
                      onTap: () {
                        print('Clicked');
                      },
                      child: Container(
                          height: 40,
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.35),
                          width: 120,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Text('Login',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white)),
                          ))))
            ]),
          );
        });
  }
}
