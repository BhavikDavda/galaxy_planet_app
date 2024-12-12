
import 'package:flutter/material.dart';

class Ttask6 extends StatefulWidget {
  const Ttask6({super.key});

  @override
  State<Ttask6> createState() => _Ttask6State();
}

class _Ttask6State extends State<Ttask6> {

  double scale = 1.0;

  void toggleScale() {
    setState(() {
      scale = scale == 1.0 ? 1.5 : 1.0;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                    image: NetworkImage('https://tse1.mm.bing.net/th?id=OIP.UYagQDMo7CCbBLXOPB5etAHaHa&pid=Api&P=0&h=180'),
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
          ],
        ),
      ),
    );
  }
}
