
import 'dart:math';
import 'package:flutter/material.dart';

class Ttask11 extends StatefulWidget {
  const Ttask11({super.key});

  @override
  State<Ttask11> createState() => _Ttask11State();
}

class _Ttask11State extends State<Ttask11> {
  bool _isTransformed = false;
  Color _color = Colors.blue;
  double _width = 100;
  double _height = 100;

  //rotate
  double _rotation = 0.0; // in radians
  void scaleRotate() {
    setState(() {
      _isTransformed = !_isTransformed;
      _color = _isTransformed ? Colors.red : Colors.blue;
      _width = _isTransformed ? 200 : 100;
      _height = _isTransformed ? 200 : 100;
      _rotation = _isTransformed ? pi / 4 : 0.0; // Rotate 45 degrees
    });
  }

  //translate
  Offset _translation = Offset(0, 0);

  void toggle() {
    setState(() {
      _isTransformed = !_isTransformed;
      _color = _isTransformed ? Colors.red : Colors.blue;
      _width = _isTransformed ? 200 : 100;
      _height = _isTransformed ? 200 : 100;
      _translation = _isTransformed ? Offset(50, 50) : Offset(0, 0);
    });
  }

  //scale
  double _scale = 1.0;

  void toggleScale() {
    setState(() {
      _isTransformed = !_isTransformed;
      _color = _isTransformed ? Colors.red : Colors.blue;
      _width = _isTransformed ? 200 : 100;
      _height = _isTransformed ? 200 : 100;
      _scale = _isTransformed ? 1.5 : 1.0;
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
              child: Transform.rotate(
                angle: _rotation,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
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
              )),
          const SizedBox(height: 20),
          Center(
              child: Transform.scale(
                scale: _scale,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
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
              )),
          const SizedBox(height: 20),
          Center(
              child: Transform.translate(
                offset: _translation,
                child: AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
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
              )),
          ElevatedButton(
            onPressed: scaleRotate,
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
          ElevatedButton(
            onPressed: changeProperties,
            child: const Text('Curve: EaseIn'),
          ),
        ],
      ),
    );
  }
}
