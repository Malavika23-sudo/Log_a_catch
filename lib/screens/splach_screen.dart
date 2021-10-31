import 'package:Machine_Test/custom_widgets/image_box.dart';
import 'package:Machine_Test/screens/login_screen.dart';
import 'package:flutter/material.dart';

class Spalach extends StatefulWidget {
  const Spalach({Key? key}) : super(key: key);

  @override
  _SpalachState createState() => _SpalachState();
}

class _SpalachState extends State<Spalach> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/background.png'), fit: BoxFit.fill)),
      child: Center(
          child: ImageContainer(
              heightImage: MediaQuery.of(context).size.height * .4,
              widthImage: 150)),
    ));
  }
}
