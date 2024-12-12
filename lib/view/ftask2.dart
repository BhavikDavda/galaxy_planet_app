
import 'package:flutter/material.dart';

class Ftask2 extends StatefulWidget {
  const Ftask2({super.key});

  @override
  State<Ftask2> createState() => _Ftask2State();
}

class _Ftask2State extends State<Ftask2> {
  bool isRed = false;
  bool isGreen = false;
  bool drag = false;
  String dragging = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Draggable(
            onDragStarted: () {
              drag == "red";
              setState(() {});
            },
            onDragEnd: (detail) {
              drag == "";
              setState(() {});
            },
            childWhenDragging: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            data: "red",
            feedback: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
            ),
            child: isRed
                ? Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.red)),
            )
                : Container(
              height: 80,
              width: 80,
              color: Colors.red,
            ),
          ),
          SizedBox(height: 10,),
          Draggable(
            onDragStarted: (){
              drag=="green";
              setState(() {});
            },
            onDragEnd: (detail){
              drag=="";
              setState(() {});
            },
            data: "green",
            feedback: Container(
              height: 80,
              width: 80,
              color: Colors.grey,
            ),
            childWhenDragging: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: isGreen
                ? Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.green)
              ),
            )
                : Container(
              height: 80,
              width: 80,
              color: Colors.green,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              DragTarget(onWillAcceptWithDetails: (detail) {
                return detail.data == "red";
              }, onAcceptWithDetails: (detail) {
                isRed = true;
                setState(() {});
              }, builder: (
                  BuildContext context,
                  List<Object?> candidateData,
                  List<dynamic> rejectedData,
                  ) {
                return Container(
                  height: (drag == "red") ? 100 : 80,
                  width: (drag == "red") ? 100 : 80,
                  decoration: BoxDecoration(
                    color: isRed ? Colors.red : Colors.transparent,
                    border: Border.all(
                        color: Colors.red, width: (drag == "red") ? 8 : 3),
                    borderRadius: BorderRadius.circular(10),
                  ),
                );
              }),

              DragTarget(
                  onWillAcceptWithDetails: (detail){
                    return detail.data=="green";
                  },
                  onAcceptWithDetails: (detail){
                    isGreen=true;
                    setState(() {});
                  },
                  builder: (BuildContext context,
                      List<Object?> candidateData,
                      List<dynamic> rejectedData,){
                    return Container(
                      height: (drag=="green") ? 100 : 80,
                      width: (drag=="green") ? 100 : 80,
                      decoration: BoxDecoration(
                        color: isGreen ? Colors.green : Colors.transparent,
                        border: Border.all(color: Colors.green,width: (drag=="green") ? 8 : 3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    );
                  })
            ],
          )
        ],
      ),
    );
  }
}
