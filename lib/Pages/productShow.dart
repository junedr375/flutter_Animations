import 'package:flutter/material.dart';

class ProductShow extends StatefulWidget {
  @override
  _ProductShowState createState() => _ProductShowState();
}

class _ProductShowState extends State<ProductShow>
    with SingleTickerProviderStateMixin {
  Animation animation, transformationAnim;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(duration: Duration(milliseconds: 700), vsync: this);

    animation = Tween(begin: 0.0, end: -0.15).animate(
      CurvedAnimation(parent: animationController, curve: Curves.ease),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget child) {
          return Scaffold(
            body: Center(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      width: 350,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RaisedButton(
                              child: Text('BUY'),
                              elevation: 7.0,
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {}),
                          SizedBox(width: 10),
                          RaisedButton(
                              child: Text('BUY'),
                              elevation: 7.0,
                              color: Colors.blue,
                              textColor: Colors.white,
                              onPressed: () {}),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: 350,
                        height: 200,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                                image: AssetImage('images/img.jpg'),
                                fit: BoxFit.cover)),
                        transform: Matrix4.translationValues(
                            0.0, width * animation.value, 0.0),
                      ),
                      onTap: () {
                        animationController.forward();
                      },
                      onDoubleTap: () {
                        animationController.reverse();
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
