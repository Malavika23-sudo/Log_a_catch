import 'package:Machine_Test/constants/style_constants.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  LoginButton({this.loginmessage, this.colour, this.onPress});
  String? loginmessage;
  Color? colour;
  VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55.0,
      margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
      child: MaterialButton(
        focusColor: Colors.amber,
        focusElevation: 100.0,
        splashColor: Colors.blue,
        color: colour,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50.0))),
        onPressed: () => onPress!(),
        child: Center(
            child: Text(
          loginmessage!,
          style: signupText,
        )),
      ),
    );
  }
}
