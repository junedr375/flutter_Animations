import 'dart:async';
import 'dart:math';

import 'package:animation/BurstAnimation/particles.dart';
import 'package:flutter/material.dart';

class BurstAnim extends StatefulWidget {
  @override
  _BurstAnimState createState() => _BurstAnimState();
}

class _BurstAnimState extends State<BurstAnim> {
  final List<Color> colors = [
    Color(0xffffc100),
    Color(0xffff9a00),
    Color(0xffff3b00),
    Color(0xffff5c00),
    Color(0xffff1a00),
    Color(0xdddd2d00),
    Color(0xcccc3b00),
    Color(0xbbbb4a00),
    Colors.blue,
    Colors.black,
    Colors.pink,
    Colors.orange,
    Colors.green,
    Colors.purple,
    Colors.greenAccent,
    Colors.grey
  ];
  final GlobalKey _boxKey = GlobalKey();
  dynamic counterText = {"count": 1, "color": Color(0xffffc100)};
  final Random random = Random();

  Rect boxSize = Rect.zero;
  List<Particle> particles = [];
  final double fps = 1 / 24;
  Timer timer;
  final double gravity = 9.81, dragCof = 0.47, airDensity = 1.1644;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Size size = _boxKey.currentContext.size;
      //Size size = MediaQuery.of(context).size;
      boxSize = Rect.fromLTRB(0, 0, size.width, size.height);
      print(boxSize);
    });

    timer = Timer.periodic(
        Duration(milliseconds: (fps * 1000).floor()), frameBuilder);
  }

  frameBuilder(dynamic timer) {
    particles.forEach((pt) {
      double dragForceX =
          -0.5 * airDensity * pow(pt.velocity.x, 2) * dragCof * pt.area;

      double dragForceY =
          -0.5 * airDensity * pow(pt.velocity.y, 2) * dragCof * pt.area;

      dragForceX = dragForceX.isInfinite ? 0.0 : dragForceX;
      dragForceY = dragForceY.isInfinite ? 0.0 : dragForceY;

      // print(dragForceX);
      // print(dragForceY);

      double accX = dragForceX / pt.mass;
      double accY = dragForceY / pt.mass + gravity;

      pt.velocity.x += accX * fps;
      pt.velocity.y += accY * fps;

      pt.position.x += pt.velocity.x * fps * 100;
      pt.position.y += pt.velocity.y * fps * 100;

      boxCollusion(pt);
    });
    setState(() {});
  }

  boxCollusion(Particle pt) {
    //Collusion with Right of the box
    if (pt.position.x > boxSize.width - pt.radius) {
      pt.position.x = boxSize.width - pt.radius;
      pt.velocity.x *= pt.jumpFactor;
    }
    //Collusion with Left of the box
    if (pt.position.x < pt.radius) {
      pt.position.x = pt.radius;
      pt.velocity.x *= pt.jumpFactor;
    }
    //Collusion with Bottom of the box
    if (pt.position.y > boxSize.height - pt.radius) {
      pt.position.y = boxSize.height - pt.radius;
      pt.velocity.y *= pt.jumpFactor;
    }
  }

  burstParticles() {
    if (particles.length > 200) {
      particles.removeRange(0, 75);
    }
    Color color = colors[random.nextInt(colors.length)];

    counterText['count'] = counterText['count'] + 1;
    counterText['color'] = color;

    int count = random.nextInt(25).clamp(5, 25);
    for (int x = 0; x < count; x++) {
      Particle p = new Particle();
      p.position = PVector(boxSize.center.dx, boxSize.center.dy);
      double randomX = random.nextDouble() * 4.0;
      if (x % 2 == 0) {
        randomX = -randomX;
      }

      double randomY = random.nextDouble() * -7.0;
      p.velocity = PVector(randomX, randomY);
      p.radius = (random.nextDouble() * 10.0).clamp(2.0, 10.0);
      p.color = color;
      particles.add(p);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: counterText['color'],
        title: Text('Burst Counter Animation'),
      ),
      body: Container(
        key: _boxKey,
        child: Stack(
          children: [
            Center(
                child: Text(
              "${counterText['count']}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: counterText['color']),
            )),
            ...particles
                .map((pt) => Positioned(
                      top: pt.position.y,
                      left: pt.position.x,
                      child: Container(
                        width: pt.radius * 2.0,
                        height: pt.radius * 2.0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: pt.color),
                      ),
                    ))
                .toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: burstParticles,
        backgroundColor: counterText['color'],
        child: Icon(Icons.add),
      ),
    );
  }
}
