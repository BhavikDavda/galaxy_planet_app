
import 'package:flutter/material.dart';

class Ttask5 extends StatefulWidget {
  const Ttask5({super.key});

  @override
  State<Ttask5> createState() => _Ttask5State();
}

class _Ttask5State extends State<Ttask5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TweenAnimationBuilder(
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
      ),
    );
  }
}
