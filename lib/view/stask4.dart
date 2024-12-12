import 'package:flutter/material.dart';
import 'package:galaxy_planet_app/view/sdetail4.dart';

class Stask4 extends StatefulWidget {
  const Stask4({super.key});

  @override
  State<Stask4> createState() => _Stask4State();
}

class _Stask4State extends State<Stask4> {

  List<String> imageList=[
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR1pb-qVaXaLJyJJAWV6jsx1yHQ-0iZS_PzAg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS2PSBxulEusmjWw8REYjZD4Zzi31RzKYUNSw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz0nTZuuMTh6O4Fm2dQiqYiNQsO1DABrX0xw&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRrTFrhr_-pYR74jUgOy7IerAoHAX3zPIZZcg&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTz9tfx9xqJQPW9wp9JlYqA8rxBJxR6kk54UA&s",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: imageList.length,
          itemBuilder: (context,index){
            return GestureDetector(
              onTap: (){
                Navigator.push(
                    context,MaterialPageRoute(builder: (context)=>Sdetail4(
                  imageUrl:imageList[index],
                  imageIndex:index,
                ))
                );
              },
              child: SizedBox(
                height: 120,
                child: Hero(
                    tag: "$index",
                    child: Image.network(imageList[index])),
              ),
            );
          }),
    );
  }
}