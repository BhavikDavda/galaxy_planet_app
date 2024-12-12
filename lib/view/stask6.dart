import 'package:flutter/material.dart';
import 'package:galaxy_planet_app/view/sdetail6.dart';

class Stask6 extends StatefulWidget {
  const Stask6({super.key});

  @override
  State<Stask6> createState() => _Stask6State();
}

class _Stask6State extends State<Stask6> {

  List<Map<String,dynamic>> images=[
    {
      "url":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s",
      "shape":"circle",
    },
    {
      "url":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2PSBxulEusmjWw8REYjZD4Zzi31RzKYUNSw&s",
      "shape":"rounded",
    },
    {
      "url":"https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz0nTZuuMTh6O4Fm2dQiqYiNQsO1DABrX0xw&s",
      "shape":"rectangle",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Image List')),
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final image = images[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Sdetail6(imageUrl: image['url'], tag: 'image$index'),
                ),
              );
            },
            child: Hero(
              tag: 'image$index',
              child: Container(
                margin: const EdgeInsets.all(8),
                height: 150,
                decoration: BoxDecoration(
                  shape: image['shape'] == "circle"
                      ? BoxShape.circle
                      : BoxShape.rectangle,
                  borderRadius: image['shape'] == "rounded"
                      ? BorderRadius.circular(20)
                      : null,
                  image: DecorationImage(
                    image: NetworkImage(image['url']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
