import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  VoidCallback? onPress;
  String? buttonTitle;
  RoundButton({this.onPress, this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => onPress!(),
      focusElevation: 30.0,
      splashColor: Colors.lightBlue.shade100,
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(
            Radius.circular(100),
          ),
          border: Border.all(
            width: 1,
            color: Colors.white,
            style: BorderStyle.solid,
          ),
        ),
        child: Center(
          child: Text(buttonTitle.toString()),
        ),
      ),
    );
  }
}
