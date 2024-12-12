
import 'package:flutter/material.dart';

class Ftask1 extends StatefulWidget {
  const Ftask1({super.key});

  @override
  State<Ftask1> createState() => _Ftask1State();
}

class _Ftask1State extends State<Ftask1> {
  bool isRed = false;
  bool isBlue = false;
  bool isDrag = false;
  String Drag = "";

  //bool isBlack = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            // LongPressDraggable<String>(
            //   data: "black",
            //   onDragStarted: () {
            //     Drag=="black";
            //     setState(() {});
            //   },
            //   onDragEnd: (detail) {
            //     Drag == "";
            //     setState(() {});
            //   },
            //   childWhenDragging: Container(
            //     height: 80,
            //     width: 80,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(color: Colors.black),
            //     ),
            //   ),
            //   child: isDrag
            //       ? Container(
            //     height: 80,
            //     width: 80,
            //     decoration: BoxDecoration(
            //       color: isBlack ? Colors.black : Colors.transparent,
            //       border: Border.all(color: Colors.black),
            //     ),
            //   )
            //       : Container(
            //     height: 80,
            //     width: 80,
            //     color: Colors.black,
            //   ),
            //   feedback: Container(
            //     height: 80,
            //     width: 80,
            //     color: isDrag ? Colors.transparent : Colors.grey,
            //   ),),
            // SizedBox(
            //   height: 20,
            // ),
            Draggable<String>(
              data: "blue",
              onDragStarted: () {
                Drag = "blue";
                setState(() {});
              },
              onDragEnd: (detail) {
                Drag == "";
                setState(() {});
              },
              childWhenDragging: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue),
                ),
              ),
              child: isBlue
                  ? Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.blue),
                ),
              )
                  : Container(
                height: 80,
                width: 80,
                color: Colors.blue,
              ),
              feedback: Container(
                height: 80,
                width: 80,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            myDrag("red", Colors.red, isRed),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                DragTarget(onWillAcceptWithDetails: (detail) {
                  return detail.data == "red";
                }, onAcceptWithDetails: (detail) {
                  isRed = true;
                  setState(() {});
                  print("onAcceptWithDetails ${detail.data} ");
                }, builder: (
                    BuildContext context,
                    List<Object?> candidateData,
                    List<dynamic> rejectedData,
                    ) {
                  return Container(
                    height: (Drag == "red") ? 100 : 80,
                    width: (Drag == "red") ? 100 : 80,
                    decoration: BoxDecoration(
                      color: isRed ? Colors.red : Colors.transparent,
                      border: Border.all(
                          color: Colors.red, width: (Drag == "red") ? 8 : 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(isRed ? "Sucess" : "Fail"),
                  );
                }),

                DragTarget(onWillAcceptWithDetails: (detail) {
                  return detail.data == "blue";
                }, onAcceptWithDetails: (detail) {
                  isBlue = true;
                  setState(() {});
                }, builder: (
                    BuildContext context,
                    List<Object?> candidateData,
                    List<dynamic> rejectedData,
                    ) {
                  return Container(
                    height: (Drag == "blue") ? 100 : 80,
                    width: (Drag == "blue") ? 100 : 80,
                    decoration: BoxDecoration(
                      color: isBlue ? Colors.blue : Colors.transparent,
                      border: Border.all(
                          color: Colors.blue, width: (Drag == "blue") ? 8 : 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(isBlue ? "Sucess" : "Fail"),
                  );
                }),

                // DragTarget(
                //     onWillAcceptWithDetails: (detail){
                //       return detail.data=="black";
                //     },
                //     onAcceptWithDetails: (detail){
                //       isBlack=true;
                //       setState(() {});
                //     },
                //     builder: (BuildContext context,
                //         List<Object?> candidateData,
                //         List<dynamic> rejectedData,) {
                //       return Container(
                //         height: (Drag == "black") ? 100 : 80,
                //         width: (Drag == "black") ? 100 : 80,
                //         decoration: BoxDecoration(
                //           color: isBlack ? Colors.black : Colors.transparent,
                //           border: Border.all(color: Colors.black,width: (Drag=="black") ? 8 : 3),
                //           borderRadius: BorderRadius.circular(10),
                //         ),
                //         child:Text(isBlue ? "Sucess" : "Fail"),
                //       );
                //     })
              ],
            ),
            //
            // ElevatedButton(onPressed: (){
            //   isBlack=false;
            //   isBlue=false;
            //   isRed=false;
            //   setState(() {});
            // }, child: Text("Reset")),
          ],
        ));
  }

  Widget myDrag(String data, Color color, bool isDrag) {
    return Draggable(
      data: data,
      feedback: Container(
        height: 80,
        width: 80,
        color: Colors.grey,
      ),
      onDragStarted: () {
        Drag = data;
        setState(() {});
        print("onDragStarted ${data}");
      },
      onDragEnd: (detail) {
        Drag == "";
        setState(() {});
      },
      child: isRed
          ? Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(10),
        ),
      )
          : Container(
        height: 80,
        width: 80,
        color: color,
      ),
      childWhenDragging: Container(
        height: 80,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color),
        ),
      ),
    );
  }
}
