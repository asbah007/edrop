import 'package:aion/src/screens/home/home_page.dart';
import 'package:aion/src/screens/login_flow/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff7A3EFB),
        backgroundColor: Color(0xffE9E9E9),

        canvasColor: Color(0xffF7F7F7),
        textTheme: TextTheme(
          button: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20
          ),
          headline1: TextStyle(
             fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
            subtitle1: TextStyle(fontWeight: FontWeight.w400,fontSize: 16),
            subtitle2: TextStyle(fontWeight: FontWeight.w400,fontSize: 12)
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
