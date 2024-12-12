
import 'dart:math';
import 'package:flutter/material.dart';

class Ttask13 extends StatefulWidget {
  const Ttask13({super.key});

  @override
  State<Ttask13> createState() => _Ttask13State();
}

class _Ttask13State extends State<Ttask13> {
  bool _toggled = false;

  double _scale = 1.0;
  double _rotation = 0.0;
  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.blue;

  void _toggleAnimation() {
    setState(() {
      _toggled = !_toggled;
      _scale = _toggled ? 1.5 : 1.0;
      _rotation = _toggled ? pi / 4 : 0.0; // Rotate 45 degrees
      _width = _toggled ? 200.0 : 100.0;
      _height = _toggled ? 200.0 : 100.0;
      _color = _toggled ? Colors.red : Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: GestureDetector(
          onTap: _toggleAnimation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                width: _width,
                height: _height,
                color: _color,
                child: Center(
                  child: Text(
                    'Tap Me!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              TweenAnimationBuilder(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                tween: Tween<double>(begin: 0.0, end: _rotation),
                builder: (context, double rotation, child) {
                  return TweenAnimationBuilder(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    tween: Tween<double>(begin: 1.0, end: _scale),
                    builder: (context, double scale, _) {
                      return Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..rotateZ(rotation)
                          ..scale(scale),
                        child: child,
                      );
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.green,
                      child: Center(
                        child: Text(
                          'Transform Me!',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _toggleAnimation,
                child: Text('Toggle Animation'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
