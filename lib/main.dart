import 'package:aion/src/screens/home/home_page.dart';
import 'package:aion/src/screens/login_flow/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Aion',
      theme: ThemeData(
        primaryColor: Color(0xff7A3EFB),
        backgroundColor: Color(0xffE9E9E9),
        canvasColor: Color(0xffF7F7F7),
        primarySwatch: colorCustom,
        appBarTheme: AppBarTheme(
            textTheme: GoogleFonts.poppinsTextTheme(TextTheme(
          headline6: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ))),
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
        textTheme: GoogleFonts.poppinsTextTheme(TextTheme(
            button: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
            headline1: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
            subtitle1: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            headline2: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 24, color: Colors.white),
            headline3: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 18, color: Colors.white),
            headline4: TextStyle(
                fontWeight: FontWeight.w500, fontSize: 12, color: Colors.black),
            headline5: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            headline6: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: Colors.white54),
            subtitle2: TextStyle(fontWeight: FontWeight.w400, fontSize: 12))),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}

MaterialColor colorCustom = MaterialColor(0xff7A3EFB, {
  50: Color.fromRGBO(122, 62, 251, .1),
  100: Color.fromRGBO(122, 62, 251, .2),
  200: Color.fromRGBO(122, 62, 251, .3),
  300: Color.fromRGBO(122, 62, 251, .4),
  400: Color.fromRGBO(122, 62, 251, .5),
  500: Color.fromRGBO(122, 62, 251, .6),
  600: Color.fromRGBO(122, 62, 251, .7),
  700: Color.fromRGBO(122, 62, 251, .8),
  800: Color.fromRGBO(122, 62, 251, .9),
  900: Color.fromRGBO(122, 62, 251, 1),
});
