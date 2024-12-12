import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade500,
        centerTitle: true,
        title: Text("${args['name']}",style: GoogleFonts.roboto(fontSize: 22,fontWeight: FontWeight.bold),),
        actions: [
          IconButton(
              onPressed: () {
                var stringJson = jsonEncode(args);
                List<String> favList = prefs.getStringList('fav') ?? [];
                if (!favList.contains(stringJson)) {
                  favList.add(stringJson);
                  prefs.setStringList('fav', favList);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Added to Favorites!")),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Already in Favorites!")),
                  );
                }
              },
              icon: Icon(Icons.favorite_border))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(args['image']),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.3),
                        width: 1.5,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 40,
                                width: 500,
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("Position : ${args['position']}",style: GoogleFonts.roboto(fontSize: 16),))),

                            SizedBox(height: 10,),
                            Container(
                                height: 40,
                                width: 500,
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("Velocity : ${args['velocity']}",style: GoogleFonts.roboto(fontSize: 16),))),
                            SizedBox(height: 10,),
                            Container(
                                height: 40,
                                width: 500,
                                decoration: BoxDecoration(
                                  color: Colors.black38,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(child: Text("Distance : ${args['distance']}",style: GoogleFonts.roboto(fontSize: 16),))),
                            SizedBox(height: 10,),
                            Text("Desciption : ",style: GoogleFonts.roboto(fontSize: 16),),
                            SizedBox(height: 10,),
                            Text("${args['description']}",style: GoogleFonts.roboto(fontSize: 16),),
                          ],
                        ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
