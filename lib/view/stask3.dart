import 'package:flutter/material.dart';
import 'package:galaxy_planet_app/view/sdetail2.dart';

class Stask3 extends StatefulWidget {
  const Stask3({super.key});

  @override
  State<Stask3> createState() => _Stask3State();
}

class _Stask3State extends State<Stask3> {

  List<Map<String, dynamic>> textImage = [
    {
      "name": "Image 1",
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s",
    },
    {
      "name": "Image 2",
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2PSBxulEusmjWw8REYjZD4Zzi31RzKYUNSw&s",
    },
    {
      "name": "Image 3",
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz0nTZuuMTh6O4Fm2dQiqYiNQsO1DABrX0xw&s",
    },
    {
      "name": "Image 4",
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrTFrhr_-pYR74jUgOy7IerAoHAX3zPIZZcg&s",
    },
    {
      "name": "Image 5",
      "image":
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz9tfx9xqJQPW9wp9JlYqA8rxBJxR6kk54UA&s",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: textImage.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Sdetail2(
                            imageUrl: textImage[index]['image'],
                            name: textImage[index]['name'],
                            imageIndex: index)));
              },
              child: Hero(
                tag: "$index",
                child: Card(
                  child: ListTile(
                    title: Image.network(textImage[index]['image']),
                    subtitle: Text(textImage[index]['name']),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
