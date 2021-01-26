import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'adding_new_bookmark_screen.dart';

class NotificationScreen extends StatefulWidget {
  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Trip History",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/empty.png",
              alignment: Alignment.center,
              height: 110,
            ),
            SizedBox(
              height: 42,
            ),
            Text(
              "No Notification",
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
