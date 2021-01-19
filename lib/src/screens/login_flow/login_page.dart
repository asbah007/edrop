import 'package:aion/src/config/constants.dart';
import 'package:aion/src/config/styles.dart';
import 'package:aion/src/screens/login_flow/otp_screen.dart';
import 'package:flutter/cupertino.dart';
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
                  Text("Login",style: TextStyle(
                    fontSize: 25,fontWeight: FontWeight.bold
                  ),),
                  Container(
                    height: 54,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Color(0xffF7F7F7),),
                    padding: const EdgeInsets.all(8.0),
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
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: kPrimaryColor,
                        onPressed: (){
                          Get.to(OTPScreen());
                        },
                        child: Text("Submit",style: TextStyle(color: Colors.white),),),
                      Text("Powered by TransXor",textAlign: TextAlign.end,style: Theme.of(context).textTheme.subtitle2,)
                    ],
                  )
                ],
              ),),
        ),
      body:Container(
        height: 500,
      ),
    );
  }
}
