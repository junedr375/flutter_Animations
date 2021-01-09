import 'package:flutter/material.dart';

class PVector {
  double x, y;

  PVector(x, y) {
    this.x = x;
    this.y = y;
  }
}

class Particle {
  PVector position = PVector(0.0, 0.0);
  PVector velocity = PVector(0.0, 0.0);
  double mass = 10.0; //kg
  double radius = 10 / 100; //1m = 100 px or pt
  Color color = Colors.green;
  double area = 0.0314; // Pi * r * r
  double jumpFactor = -0.6; // bounce back factor
}
