
import 'package:flutter/material.dart';

class Sdetail4 extends StatefulWidget {
  String imageUrl="";
  int imageIndex=0;
  Sdetail4({super.key,required this.imageIndex,required this.imageUrl});

  @override
  State<Sdetail4> createState() => _Sdetail4State();
}

class _Sdetail4State extends State<Sdetail4> {
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
          ElevatedButton(onPressed: (){
            Navigator.of(context).pushNamed("sdetail4");
          }, child: Text("Back")),
        ],
      ),
    );
  }
}
