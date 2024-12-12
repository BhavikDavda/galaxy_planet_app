
import 'package:flutter/material.dart';

class Sdetail2 extends StatefulWidget {
  String imageUrl="";
  String name="";
  int imageIndex=0;
  Sdetail2({super.key,required this.imageUrl,required this.imageIndex,required this.name});

  @override
  State<Sdetail2> createState() => _Sdetail2State();
}

class _Sdetail2State extends State<Sdetail2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Hero(
          tag: "${widget.imageIndex}",
          child: Card(
            child:ListTile(
              title: Image.network(widget.imageUrl),
              subtitle: Text(widget.name),
            ),
          ),
        )
    );
  }
}
