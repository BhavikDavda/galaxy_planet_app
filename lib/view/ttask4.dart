
import 'package:flutter/material.dart';

class Ttask4 extends StatefulWidget {
  const Ttask4({super.key});

  @override
  State<Ttask4> createState() => _Ttask4State();
}

class _Ttask4State extends State<Ttask4> {

  double _width = 100.0;
  double _height = 100.0;
  Color _color = Colors.blue;
  double _borderRadius = 0.0;

  void _toggleAnimation() {
    setState(() {
      if (_width == 100.0) {
        _width = 200.0;
        _height = 200.0;
        _color = Colors.red;
        _borderRadius = 50.0;
      } else {
        _width = 100.0;
        _height = 100.0;
        _color = Colors.blue;
        _borderRadius = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              width: _width,
              height: _height,
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_borderRadius),
              ),
              duration: const Duration(seconds: 2),
              curve: Curves.easeIn,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleAnimation,
              child: const Text('Animate'),
            ),
          ],
        ),
      ),
    );
  }
}
