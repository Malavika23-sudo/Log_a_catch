import 'package:flutter/material.dart';

class LoginTextField extends StatelessWidget {
  String? hint;
  final Function(String value)? onChanged;
  final String? Function(String? value)? onValidate;
  TextInputType? keyboard;
  LoginTextField({this.hint, this.onChanged, this.onValidate, this.keyboard});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
            keyboardType: keyboard,
            onChanged: onChanged,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              fillColor: Colors.white54,
              hintText: hint,
              errorStyle: TextStyle(
                color: Colors.red,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green, width: 1.0),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white54),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white54),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.white54),
              ),
            ),
            validator: onValidate),
        SizedBox(
          height: MediaQuery.of(context).size.height * .015,
        )
      ],
    );
  }
}

class OtpTextField extends StatelessWidget {
  String? hint;
  int? maximumLength;
  bool visibility;
  TextInputType? keyboard;
  Widget? eyeIcon;
  final Function(String value)? onChanged;
  final String? Function(String? value)? onValidate;
  OtpTextField(
      {this.hint,
      this.maximumLength,
      this.visibility = true,
      this.keyboard,
      this.eyeIcon,
      this.onChanged,
      this.onValidate});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 298.0,
      color: Colors.white54,
      margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: TextFormField(
        validator: onValidate,
        onChanged: onChanged,
        textAlign: TextAlign.center,
        obscureText: visibility,
        obscuringCharacter: '.',
        keyboardType: keyboard,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          suffixIcon: eyeIcon,
          fillColor: Colors.white54,
          hintText: hint,
        ),
      ),
    );
  }
}
