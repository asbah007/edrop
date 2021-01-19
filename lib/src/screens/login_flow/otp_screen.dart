import 'package:aion/src/components/Buttons.dart';
import 'package:aion/src/config/constants.dart';
import 'package:aion/src/screens/login_flow/user_information.dart';
import 'package:aion/utils/packages/pincode_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPScreen extends StatefulWidget {
  @override
  State createState() {
    return OTPScreenState();
  }
}

class OTPScreenState extends State<OTPScreen> {
  // UserController userController=Get.put(UserController());
  bool hasError = false;
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Spacer(
            flex: 2,
          ),
          Text(
            "OTP Verification",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(fontWeight: FontWeight.bold, color: kPrimaryColor),
            textAlign: TextAlign.start,
          ),
          SizedBox(
            height: 8,
          ),
          Text("A verification code has bee sent to your mobile number",
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.subtitle1),
          Spacer(
            flex: 6,
          ),
          PinCodeTextField(
            autofocus: true,
            controller: otpController,
            hideCharacter: true,
            highlight: true,
            pinBoxColor: Colors.white,
            highlightColor: Colors.blue,
            defaultBorderColor: Colors.transparent,
            hasTextBorderColor: kPrimaryColor,
            maxLength: 6,
            pinBoxRadius: 10,
            hasError: hasError,
            maskCharacter: "*",
            onTextChanged: (text) {
              setState(() {
                hasError = false;
              });
            },
            onDone: (text) {
              print("DONE $text");
              print("DONE CONTROLLER ${otpController.text}");
            },
            pinBoxWidth: 50,
            pinBoxHeight: 54,
            hasUnderline: false,
            wrapAlignment: WrapAlignment.spaceAround,
            pinBoxDecoration: ProvidedPinBoxDecoration.defaultPinBoxDecoration,
            pinTextStyle: TextStyle(fontSize: 22.0),
            pinTextAnimatedSwitcherTransition:
                ProvidedPinBoxTextAnimation.scalingTransition,
//                    pinBoxColor: Colors.green[100],
            pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
//                    highlightAnimation: true,
            highlightAnimationBeginColor: Colors.black,
            highlightAnimationEndColor: Colors.white12,
            keyboardType: TextInputType.number,
          ),
          Spacer(
            flex: 6,
          ),
          Center(
            child: FlatButton(
              child: Text(
                "Resend OTP",
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                    color: Colors.black54, fontWeight: FontWeight.w700),
              ),
              onPressed: () {
                // Fluttertoast.showToast(
                //     msg: "Code resent",
                //     toastLength: Toast.LENGTH_SHORT,
                //     gravity: ToastGravity.BOTTOM,
                //     timeInSecForIosWeb: 1,
                //     backgroundColor: CustomColors.canvas,
                //     textColor: CustomColors.grey_3,
                //     fontSize: 14.0
                // );
              },
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Row(children: [
            Expanded(
              child: SizedBox(
                  height: 50,
                  child: kPrimaryButton(
                      color: kPrimaryColor, onTap: () {
                        Get.to(UserInfo());
                  }, title: "Submit")),
            ),
          ]),
        ],
      ),
    ));
  }
}
