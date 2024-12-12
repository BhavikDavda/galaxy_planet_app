
import 'package:flutter/material.dart';

class Ttask7 extends StatefulWidget {
  const Ttask7({super.key});

  @override
  State<Ttask7> createState() => _Ttask7State();
}

class _Ttask7State extends State<Ttask7> {
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
              tween: Tween<Offset>(
                  begin: Offset(0.0, 0.0), end: Offset(positionX, positionY)),
              duration: Duration(seconds: 2),
              builder: (context, val, child) {
                return Transform.translate(
                    offset: val,
                    child: child
                );
              },
              child: Container(
                color: Colors.blue,
                child: Text("Hello",style: TextStyle(color: Colors.white, fontSize: 20),),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: (){
              toggle();
            }, child: Text("Toggle")),
          ],
        ),
      ),
    );
  }
}
