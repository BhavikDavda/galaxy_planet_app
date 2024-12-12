import 'package:flutter/material.dart';
import 'package:galaxy_planet_app/view/sdetail5.dart';

class Stask5 extends StatefulWidget {
  const Stask5({super.key});

  @override
  State<Stask5> createState() => _Stask5State();
}

class _Stask5State extends State<Stask5> {

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

    int index=0;

    return Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: textImage.map((e){
              int currentIndex=index++;
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Sdetail5(
                              imageUrl: e['image'],
                              name:e['name'],
                              imageIndex: currentIndex)));
                },
                child: Hero(
                  tag: "$currentIndex",
                  child: Container(
                    height: 100,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Image.network(e['image']),
                        Text(e['name']),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        )
    );
  }
}
