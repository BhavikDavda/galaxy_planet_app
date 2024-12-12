
import 'package:flutter/material.dart';

class Ttask8 extends StatefulWidget {
  const Ttask8({super.key});

  @override
  State<Ttask8> createState() => _Ttask8State();
}

class _Ttask8State extends State<Ttask8> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: TweenAnimationBuilder(
              tween: Tween<double>(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 2),
              builder: (context, val, child) {
                return Transform.rotate(
                    angle: val * 6.3,
                    child: Icon(
                      Icons.arrow_upward,
                      size: 50,
                    ));
              }),
        ));
  }
}
