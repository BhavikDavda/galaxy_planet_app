
import 'package:flutter/material.dart';

class Ttask1 extends StatefulWidget {
  const Ttask1({super.key});

  @override
  State<Ttask1> createState() => _Ttask1State();
}

class _Ttask1State extends State<Ttask1> {

  bool isBig=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: InkWell(
        onTap: (){
          setState(() {
            isBig=!isBig;
          });
        },
        child: AnimatedContainer(
          duration: Duration(seconds: 2),
          width: isBig ? 100 : 300,
          height: isBig ? 100 : 300,
          color: isBig ? Colors.red : Colors.green,
        ),
      ),
    );
  }
}
