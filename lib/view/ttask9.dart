
import 'package:flutter/material.dart';

class Ttask9 extends StatefulWidget {
  const Ttask9({super.key});

  @override
  State<Ttask9> createState() => _Ttask9State();
}

class _Ttask9State extends State<Ttask9> {
  double scale = 1.0;

  void toggleScale() {
    setState(() {
      scale = scale == 1.0 ? 1.5 : 1.0;
    });
  }

  double positionX = 0.0;
  double positionY = 0.0;

  void toggle() {
    setState(() {
      positionX = positionX == 0.0 ? 200.0 : 0.0;
      positionY = positionY == 0.0 ? 200.0 : 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            TweenAnimationBuilder(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: Duration(seconds: 2),
                builder: (context, val, child) {
                  return Transform.rotate(
                      angle: val * 6.3,
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://tse4.mm.bing.net/th?id=OIP.6f5ZEeT1bM05vEOyFk2a7AHaHa&pid=Api&P=0&h=180"),
                          ),
                        ),
                      ));
                }),
            SizedBox(height: 40),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 1.0, end: scale),
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              builder: (context, double value, child) {
                return Transform.scale(
                  scale: value,
                  child: child,
                );
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://tse1.mm.bing.net/th?id=OIP.UYagQDMo7CCbBLXOPB5etAHaHa&pid=Api&P=0&h=180'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: toggleScale,
              child: Text(scale == 1.0 ? 'Scale Up' : 'Scale Down'),
            ),
            SizedBox(height: 40),
            TweenAnimationBuilder(
              tween: Tween<Offset>(
                  begin: Offset(0.0, 0.0), end: Offset(positionX, positionY)),
              duration: Duration(seconds: 2),
              builder: (context, val, child) {
                return Transform.translate(offset: val, child: child);
              },
              child: Container(
                color: Colors.blue,
                child: Text(
                  "Hello",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  toggle();
                },
                child: Text("Toggle")),
          ],
        ),
      ),
    );
  }
}
