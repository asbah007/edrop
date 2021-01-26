import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'adding_new_bookmark_screen.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
          children: [
            SizedBox(
              height: 22,
            ),
            ListTile(
              title: Text(
                "Lorem ipsum dolor sit amet, conse ctetuer adipiscing elit, sed ",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black),
              ),
              trailing: Icon(
                Icons.chevron_right,
                size: 30,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            ListTile(
              title: Text(
                "Lorem ipsum dolor sit amet, conse ctetuer adipiscing elit, sed ",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black),
              ),
              trailing: Icon(
                Icons.chevron_right,
                size: 30,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            ListTile(
              title: Text(
                "Lorem ipsum dolor sit amet, conse ctetuer adipiscing elit, sed ",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black),
              ),
              trailing: Icon(
                Icons.chevron_right,
                size: 30,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            ListTile(
              title: Text(
                "Lorem ipsum dolor sit amet, conse ctetuer adipiscing elit, sed ",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black),
              ),
              trailing: Icon(
                Icons.chevron_right,
                size: 30,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            ListTile(
              title: Text(
                "Lorem ipsum dolor sit amet, conse ctetuer adipiscing elit, sed ",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black),
              ),
              trailing: Icon(
                Icons.chevron_right,
                size: 30,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            ListTile(
              title: Text(
                "Lorem ipsum dolor sit amet, conse ctetuer adipiscing elit, sed ",
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.black),
              ),
              trailing: Icon(
                Icons.chevron_right,
                size: 30,
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
          ],
        ),
      ),
    );
  }
}
