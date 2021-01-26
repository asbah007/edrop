import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:aion/src/screens/login_flow/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A3EFB),
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      bottomSheet: Container(
        height: 280.0,
        color: Colors.transparent, //could change this to Color(0xFF737373),
        //so you don't have to change MaterialApp canvasColor
        child: new Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(15.0),
                  topRight: const Radius.circular(15.0))),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Login",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffF7F7F7),
                ),
                child: TextField(
                  decoration: kTextFieldDecor(title: "Enter the mobile number"),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FlatButton(
                    height: 54,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: kPrimaryColor,
                    onPressed: () {
                      Get.to(OTPScreen());
                    },
                    child: Text(
                      "Submit",
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  Text(
                    "Powered by TransXor",
                    textAlign: TextAlign.end,
                    style: Theme.of(context).textTheme.subtitle2,
                  )
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(
          bottom: 280.0,
        ),
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: AssetImage(
                  "assets/images/flash.png",
                )),
            gradient: LinearGradient(colors: [
              Color(0xFF7A3EFB),
              Color(0xFF541EC5),
            ])),
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 100),
          child: Image.asset(
            "assets/images/Logo.png",
            width: 211,
          ),
        ),
      ),
    );
  }
}
