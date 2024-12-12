
import 'package:flutter/material.dart';

class Sdetail5 extends StatefulWidget {
  String imageUrl="";
  String name="";
  int imageIndex=0;
  Sdetail5({super.key,required this.imageUrl,required this.imageIndex,required this.name});

  @override
  State<Sdetail5> createState() => _Sdetail5State();
}

class _Sdetail5State extends State<Sdetail5> {
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
      ),
    );
  }
}
