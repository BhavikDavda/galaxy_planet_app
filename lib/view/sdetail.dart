
import 'package:flutter/material.dart';

class Sdetail extends StatefulWidget {

  String imageUrl="";
  int imageIndex=0;

  Sdetail({super.key,required this.imageUrl,required this.imageIndex});

  @override
  State<Sdetail> createState() => _SdetailState();
}

class _SdetailState extends State<Sdetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 500,
            width: double.infinity,
            child: Hero(
                tag: "${widget.imageIndex}",
                child: Image.network(widget.imageUrl ?? "")),
          ),
        ],
      ),
    );
  }
}
