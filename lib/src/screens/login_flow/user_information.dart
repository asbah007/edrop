import 'package:aion/src/components/Buttons.dart';
import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:aion/src/screens/home/home_page.dart';
import 'package:aion/utils/packages/pincode_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInfo extends StatefulWidget {
  @override
  State createState() {
    return UserInfoState();
  }
}

class UserInfoState extends State<UserInfo> {
  // UserController userController=Get.put(UserController());
  bool hasError = false;
  TextEditingController userName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(
                flex: 1,
              ),
              Text(
                "Enter your name",
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
                textAlign: TextAlign.start,
              ),
              SizedBox(
                height: 8,
              ),
              Text("Lorem epusm dlor idiot sit amet, consecuter adpsicing rliot",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.subtitle1),
              Spacer(
                flex: 2,
              ),
              Container(

                decoration: BoxDecoration(color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: TextField(
                  decoration: kTextFieldDecor(title: "  Enter here"),
                  textAlign: TextAlign.center
                ),
              ),
              Spacer(
                flex: 6,
              ),
              Row(children: [
                Expanded(
                  child: SizedBox(
                      height: 50,
                      child: kPrimaryButton(
                          color: kPrimaryColor, onTap: () {
                            Get.to(HomePage());
                      }, title: "Submit")),
                ),
              ]),
            ],
          ),
        ));
  }
}
