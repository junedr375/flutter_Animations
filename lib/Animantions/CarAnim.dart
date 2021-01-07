import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class CarANim extends StatefulWidget {
  @override
  _CarANimState createState() => _CarANimState();
}

class _CarANimState extends State<CarANim> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController animationController;
  Animation cirle_anim;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    animation = Tween(begin: -0.4, end: 0.7).animate(CurvedAnimation(
        parent: animationController, curve: Curves.fastOutSlowIn));
    cirle_anim = Tween(begin: 0.2, end: 1).animate(
        CurvedAnimation(parent: animationController, curve: Curves.linear));

    animationController.repeat();
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Transform(
                    transform: Matrix4.translationValues(
                        animation.value * width, 0.0, 0.0),
                    child: Container(
                        height: cirle_anim.value * 100,
                        width: cirle_anim.value * 100,
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(35)),
                        child: Center(
                            child: Icon(
                          Icons.local_shipping,
                          color: Colors.teal,
                          size: 40,
                        ))),
                  ),
                ],
              ),
              Container(
                height: 10,
                width: width,
                color: Colors.black,
              ),
            ]),
          );
        });
  }
}
