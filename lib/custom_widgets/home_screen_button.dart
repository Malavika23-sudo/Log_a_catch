import 'package:Machine_Test/constants/color_constants.dart';
import 'package:flutter/material.dart';

class SignupButton extends StatelessWidget {
  final String? text;
  const SignupButton({this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      margin: EdgeInsets.only(bottom: 10.0, top: 10.0),
      child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            backgroundColor: homeButtonClour,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            side: const BorderSide(color: Colors.white),
          ),
          child: Center(
              child: Text(text.toString(),
                  style: Theme.of(context).textTheme.bodyText2))),
    );
  }
}
