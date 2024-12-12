
import 'package:flutter/material.dart';

class Sdetail6 extends StatefulWidget {
  final String imageUrl;
  final String tag;

  const Sdetail6({super.key, required this.imageUrl, required this.tag});

  @override
  State<Sdetail6> createState() => _Sdetail6State();
}

class _Sdetail6State extends State<Sdetail6> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image Detail')),
      body: Center(
        child: Hero(
          tag: widget.tag,
          child: Image.network(widget.imageUrl, fit: BoxFit.contain),
        ),
      ),
    );
  }
}
