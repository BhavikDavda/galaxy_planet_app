import 'dart:math';
import 'package:flutter/material.dart';

class Ttask2 extends StatefulWidget {
  const Ttask2({Key? key}) : super(key: key);

  @override
  State<Ttask2> createState() => _Ttask2State();
}

class _Ttask2State extends State<Ttask2> {
  Color containerColor = Colors.blue;
  double borderRadius = 0.0;
  double containerHeight = 100.0;
  double containerWidth = 100.0;
  Curve animationCurve = Curves.easeIn;
  final random = Random();

  Color getRandomColor() {
    return Color.fromARGB(
      255,
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }

  void changeProperties() {
    setState(() {
      containerColor = getRandomColor();
      borderRadius = random.nextDouble() * 50; // Random border radius
      containerHeight = random.nextDouble() * 200 + 50; // Height between 50 and 250
      containerWidth = random.nextDouble() * 200 + 50; // Width between 50 and 250
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
            child: AnimatedContainer(
              duration: const Duration(seconds: 2),
              curve: animationCurve,
              height: containerHeight,
              width: containerWidth,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: changeProperties,
            child: const Text('Change Properties'),
          ),
          const SizedBox(height: 20),
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
