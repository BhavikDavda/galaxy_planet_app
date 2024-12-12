import 'package:flutter/material.dart';
import 'package:galaxy_planet_app/provider/themeprovider.dart';
import 'package:galaxy_planet_app/view/detail.dart';
import 'package:galaxy_planet_app/view/ftask.dart';
import 'package:galaxy_planet_app/view/ftask2.dart';
import 'package:galaxy_planet_app/view/homepage.dart';
import 'package:galaxy_planet_app/view/like.dart';
import 'package:galaxy_planet_app/view/sdetail.dart';
import 'package:galaxy_planet_app/view/sdetail2.dart';
import 'package:galaxy_planet_app/view/sdetail4.dart';
import 'package:galaxy_planet_app/view/sdetail5.dart';
import 'package:galaxy_planet_app/view/sdetail6.dart';
import 'package:galaxy_planet_app/view/splash.dart';
import 'package:galaxy_planet_app/view/stask1.dart';
import 'package:galaxy_planet_app/view/stask2.dart';
import 'package:galaxy_planet_app/view/stask3.dart';
import 'package:galaxy_planet_app/view/stask4.dart';
import 'package:galaxy_planet_app/view/stask5.dart';
import 'package:galaxy_planet_app/view/stask6.dart';
import 'package:galaxy_planet_app/view/ttask1.dart';
import 'package:galaxy_planet_app/view/ttask10.dart';
import 'package:galaxy_planet_app/view/ttask11.dart';
import 'package:galaxy_planet_app/view/ttask12.dart';
import 'package:galaxy_planet_app/view/ttask13.dart';
import 'package:galaxy_planet_app/view/ttask2.dart';
import 'package:galaxy_planet_app/view/ttask3.dart';
import 'package:galaxy_planet_app/view/ttask4.dart';
import 'package:galaxy_planet_app/view/ttask5.dart';
import 'package:galaxy_planet_app/view/ttask6.dart';
import 'package:galaxy_planet_app/view/ttask7.dart';
import 'package:galaxy_planet_app/view/ttask8.dart';
import 'package:galaxy_planet_app/view/ttask9.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

late SharedPreferences prefs;

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  prefs=await SharedPreferences.getInstance();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.currentMode,
          debugShowCheckedModeBanner: false,
          routes: {
            "/": (context) => Splash(),
            "home": (context) => HomePage(),
            "detail": (context) => Detail(),
            "like": (context) => Like(),

            "ftask1": (context) => Ftask1(),
            "ftask2": (context) => Ftask2(),

            "sdetail": (context) => Sdetail(
              imageIndex: 0,
              imageUrl: "",
            ),
            "stask1": (context) => Stask1(),
            "sdetail2": (context) =>
                Sdetail2(imageIndex: 0, imageUrl: "", name: ""),
            "stask2": (context) => Stask2(),
            "stask3": (context) => Stask3(),
            "sdetail4": (context) => Sdetail4(imageIndex: 0, imageUrl: ""),
            "stask4": (context) => Stask4(),
            "sdetail5": (context) =>
                Sdetail5(imageIndex: 0, imageUrl: "", name: ""),
            "stask5": (context) => Stask5(),
            "sdetail6": (context) => Sdetail6(tag: "", imageUrl: ""),
            "stask6": (context) => Stask6(),

            "ttask1": (context) => Ttask1(),
            "ttask2": (context) => Ttask2(),
            "ttask3": (context) => Ttask3(),
            "ttask4": (context) => Ttask4(),
            "ttask5": (context) => Ttask5(),
            "ttask6": (context) => Ttask6(),
            "ttask7": (context) => Ttask7(),
            "ttask8": (context) => Ttask8(),
            "ttask9": (context) => Ttask9(),
            "ttask10": (context) => Ttask10(),
            "ttask11": (context) => Ttask11(),
            "ttask12": (context) => Ttask12(),
            "ttask13": (context) => Ttask13(),
          },
        );
      },
    ),
  ));
}