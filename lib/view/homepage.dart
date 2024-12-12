import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../provider/themeprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List decodeJson = [];

  void loadData() {
    rootBundle.loadString("asset/planets.json").then((json) {
      setState(() {
        decodeJson = jsonDecode(json);
      });
    });
  }

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
        drawer: Drawer(
          child: DrawerHeader(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ftask1");
                        },
                        child: Text("Lec 1 Task 1")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ftask2");
                        },
                        child: Text("Lec 1 Task 2")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("stask1");
                        },
                        child: Text("Lec 2 Task 1")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("stask2");
                        },
                        child: Text("Lec 2 Task 2")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("stask3");
                        },
                        child: Text("Lec 2 Task 3")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("stask4");
                        },
                        child: Text("Lec 2 Task 4")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("stask5");
                        },
                        child: Text("Lec 2 Task 5")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("stask6");
                        },
                        child: Text("Lec 2 Task 6")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ttask1");
                        },
                        child: Text("Lec 3 Task 1")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ttask2");
                        },
                        child: Text("Lec 3 Task 2")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ttask3");
                        },
                        child: Text("Lec 3 Task 3")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ttask4");
                        },
                        child: Text("Lec 3 Task 4")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ttask5");
                        },
                        child: Text("Lec 3 Task 5")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ttask6");
                        },
                        child: Text("Lec 3 Task 6")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ttask7");
                        },
                        child: Text("Lec 3 Task 7")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ttask8");
                        },
                        child: Text("Lec 3 Task 8")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ttask9");
                        },
                        child: Text("Lec 3 Task 9")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ttask10");
                        },
                        child: Text("Lec 3 Task 10")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ttask11");
                        },
                        child: Text("Lec 3 Task 11")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ttask12");
                        },
                        child: Text("Lec 3 Task 12")),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed("ttask13");
                        },
                        child: Text("Lec 3 Task 13")),
                  ],
                ),
              )),
        ),
        appBar: AppBar(
          backgroundColor: Colors.grey.shade500,
          actions: [
            Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
              return IconButton(
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                  icon: themeProvider.isDarkMode
                      ? Icon(Icons.light_mode)
                      : Icon(Icons.dark_mode));
            }),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("like");
                },
                icon: Icon(Icons.favorite))
          ],
          centerTitle: true,
          title: Text(
            "Planets", style: GoogleFonts.roboto(fontSize: 22,fontWeight: FontWeight.bold),
          ),
        ),
        body: ListView.builder(
          // separatorBuilder: (context, index){
          //   return SizedBox(height: 20,);
          // },
            itemCount: decodeJson.length,
            itemBuilder: (context, index) {
              Map<String, dynamic> item = decodeJson[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed("detail", arguments: decodeJson[index]);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.white.withOpacity(0.3),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: Image.network(item['image'],height: 120,width: 120,),
                                ),
                                Text(item['name'],style: GoogleFonts.roboto(fontSize: 16),)
                              ],
                            ),
                            SizedBox(width: 30,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Position : ${item['position']}",style: GoogleFonts.roboto(fontSize: 16),),
                                SizedBox(height: 20,),
                                Text("Velocity : ${item['velocity']}",style: GoogleFonts.roboto(fontSize: 16),),
                                SizedBox(height: 20,),
                                Text("Distance : ${item['distance']}",style: GoogleFonts.roboto(fontSize: 16),),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
