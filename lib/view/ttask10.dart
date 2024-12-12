import 'dart:math';
import 'package:flutter/material.dart';

class Ttask10 extends StatefulWidget {
  const Ttask10({super.key});

  @override
  State<Ttask10> createState() => _Ttask10State();
}

class _Ttask10State extends State<Ttask10> {
  //translate
  double positionX = 0.0;
  double positionY = 0.0;

  void toggle() {
    setState(() {
      positionY = positionY == 0.0 ? 200.0 : 0.0;
      positionX = positionX == 0.0 ? 200.0 : 0.0;
    });
  }

  //scale
  double scale = 1.0;

  void toggleScale() {
    setState(() {
      scale = scale == 1.0 ? 1.5 : 1.0;
    });
  }

  //rotate
  double borderRadius = 0.0;
  Curve animationCurve = Curves.easeIn;
  final random = Random();

  void changeProperties() {
    setState(() {
      borderRadius = random.nextDouble() * 50;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0.0, end: 1.0),
                duration: Duration(seconds: 2),
                builder: (context, val, child) {
                  return Transform.rotate(
                    angle: val * 6.3,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      curve: animationCurve,
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      child: Center(
                          child: Text(
                            'Rotate',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                  );
                },
              )),
          const SizedBox(height: 20),
          Center(
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 1.0, end: scale),
                duration: Duration(seconds: 2),
                builder: (context, val, child) {
                  return Transform.scale(
                    scale: val,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      curve: animationCurve,
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      child: Center(
                          child: Text(
                            'Scale',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                  );
                },
              )),
          const SizedBox(height: 20),
          Center(
              child: TweenAnimationBuilder(
                tween:
                Tween<Offset>(begin: Offset(0.0, 0.0), end: Offset(positionX, positionY )),
                duration: Duration(seconds: 2),
                builder: (context, val, child) {
                  return Transform.translate(
                    offset: val,
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 2),
                      curve: animationCurve,
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(borderRadius),
                      ),
                      child: Center(
                          child: Text(
                            'Translate',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                    ),
                  );
                },
              )),
          ElevatedButton(
            onPressed: changeProperties,
            child: const Text('Rotate'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: toggleScale,
            child: const Text('Scale'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: toggle,
            child: const Text('Translate'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    animationCurve = Curves.easeIn;
                  });
                },
                child: const Text('Curve: EaseIn'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    animationCurve = Curves.bounceOut;
                  });
                },
                child: const Text('Curve: BounceOut'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    animationCurve = Curves.elasticInOut;
                  });
                },
                child: const Text('Curve: ElasticInOut'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}