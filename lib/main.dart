import 'package:animation/Animantions/CarAnim.dart';
import 'package:animation/Animantions/ContinuousAnimation.dart';
import 'package:animation/Animantions/FlipAnimtion.dart';
import 'package:animation/Animantions/loginPage.dart';
import 'package:animation/Animantions/toggleTest.dart';
import 'package:animation/BurstAnimation/burstAnim.dart';
import 'package:animation/OtherBurtAnim/OtherburstAnim.dart';
import 'package:animation/Pages/AnimatedSwitcher.dart';
import 'package:animation/Pages/GoogleMap.dart';
import 'package:animation/Pages/TinderLikePage.dart';
import 'package:animation/Pages/loader.dart';
import 'package:animation/Pages/productShow.dart';
import 'package:animation/ballJump/ball_jump.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OtherBurstAnim(),
    );
  }
}
