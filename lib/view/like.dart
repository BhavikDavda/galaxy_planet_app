import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../main.dart';

class Like extends StatefulWidget {
  const Like({super.key});

  @override
  State<Like> createState() => _LikeState();
}

class _LikeState extends State<Like> {
  List<Map<String, dynamic>> favList = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() {
    final savedList = prefs.getStringList('fav') ?? [];
    favList = savedList
        .map((item) => jsonDecode(item) as Map<String, dynamic>)
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade500,
        title: Text(
          "Favorites",
          style: GoogleFonts.roboto(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
      body: favList.isEmpty
          ? Center(
              child: Text(
                "No Favorite yet!",
                style: GoogleFonts.roboto(fontSize: 20),
              ),
            )
          : ListView.builder(
              itemCount: favList.length,
              itemBuilder: (context, index) {
                final favItem = favList[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network(
                              favItem['image'],
                              height: 140,
                              width: 140,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Name : ${favItem['name']}",
                                  style: GoogleFonts.roboto(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Velocity : ${favItem['velocity']}",
                                  style: GoogleFonts.roboto(fontSize: 15),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Distance : ${favItem['distance']}",
                                  style: GoogleFonts.roboto(fontSize: 15),
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                favList.removeAt(index);
                                setState(() {});
                                prefs.setStringList('fav', favList.map((item) => jsonEncode(item)).toList());
                              },
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
    );
  }
}
