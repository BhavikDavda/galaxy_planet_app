
import 'dart:math';
import 'package:flutter/material.dart';

class Ttask3 extends StatefulWidget {
  const Ttask3({super.key});

  @override
  State<Ttask3> createState() => _Ttask3State();
}

class _Ttask3State extends State<Ttask3> {
  Color currentColor=Colors.green;
  final random = Random();

  Color getColor() {
    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TweenAnimationBuilder<Color>(
                tween: Tween<Color>(
                    begin: currentColor,
                    end: currentColor),
                duration: Duration(seconds: 3),
                builder: (context, value, child) {
                  return Container(
                    height: 200,
                    width: 200,
                    color: value,
                  );
                }),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentColor = getColor();
                  });
                },
                child: Text("Change Color"))
          ],
        ),
      ),
    );
  }
}
