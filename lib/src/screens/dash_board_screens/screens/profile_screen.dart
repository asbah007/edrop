import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = new TextEditingController();

  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          "Profile",
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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          child: Icon(
                            Icons.account_circle_rounded,
                            size: 146,
                            color: Colors.black54,
                          ),
                        ),
                        Positioned(
                          bottom: 15,
                          right: 15,
                          child: CircleAvatar(
                            child: Icon(
                              Icons.edit,
                              size: 18,
                              color: Colors.black,
                            ),
                            radius: 15,
                            backgroundColor: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 52,
                    decoration: kContainerBorder(10.0).copyWith(
                      color: Color(0xffFFFFFF),
                    ),
                    child: TextField(
                      autofocus: false,
                      controller: nameController,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10)),
                      style: Theme.of(context).textTheme.bodyText1,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.name,
                      textCapitalization: TextCapitalization.words,
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text("Number",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 52,
                    decoration: kContainerBorder(10.0).copyWith(
                      color: Color(0xffFFFFFF),
                    ),
                    child: TextField(
                      autofocus: false,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10)),
                      style: Theme.of(context).textTheme.bodyText1,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.number,
                      textCapitalization: TextCapitalization.words,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text("Mail Id",
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey)),
                  SizedBox(
                    height: 8,
                  ),
                  Container(
                    height: 52,
                    decoration: kContainerBorder(10.0).copyWith(
                      color: Color(0xffFFFFFF),
                    ),
                    child: TextField(
                      autofocus: false,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                          enabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 10)),
                      style: Theme.of(context).textTheme.bodyText1,
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.emailAddress,
                      textCapitalization: TextCapitalization.words,
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Container(),
              )
            ],
          )),
    );
  }
}
