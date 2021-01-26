import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'adding_new_bookmark_screen.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: EdgeInsets.fromLTRB(
              16, 38, 16, MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Bookmarks",
                style: Theme.of(context).textTheme.headline5,
                textAlign: TextAlign.start,
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                leading: Container(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: kContainerBorder(10.0),
                ),
                // trailing: Transform.translate(
                //   offset: Offset(10, -10),
                //   child: Icon(
                //     Icons.menu,
                //   ),
                // ),
                title: Text("Home"),
                subtitle: Text("3139 Jadewood farms"),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                leading: Container(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: kContainerBorder(10.0),
                ),
                title: Text("Collage"),
                subtitle: Text("3288 Foresston Road"),
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                leading: Container(
                  child: Icon(
                    Icons.location_on,
                    color: Colors.black,
                  ),
                  padding: EdgeInsets.all(10),
                  decoration: kContainerBorder(10.0),
                ),
                title: Text("Office"),
                subtitle: Text("3369 Bridge Avenue Jadewood farms"),
              ),
              SizedBox(
                height: 30,
              ),
              FlatButton(
                height: 50,
                minWidth: double.infinity,
                child: Text("Add new bookmark",
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        .copyWith(color: Colors.white)),
                onPressed: () {
                  Get.to(AddBookMark());
                },
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              SizedBox(
                height: 30,
              ),
              Text("Add Payment Methods",
                  style: Theme.of(context).textTheme.bodyText1.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.black)),
            ],
          )),
    );
  }
}
