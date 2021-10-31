import 'dart:ui';
import 'package:Machine_Test/constants/color_constants.dart';
import 'package:Machine_Test/constants/style_constants.dart';
import 'package:Machine_Test/custom_widgets/divider_for_or.dart';
import 'package:Machine_Test/custom_widgets/image_box.dart';
import 'package:Machine_Test/custom_widgets/signup_button.dart';
import 'package:Machine_Test/screens/email_login_screen.dart';
import 'package:Machine_Test/screens/email_registration_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const loginbuttoncolor = Color(0xFF53b578);

class LoginScreen extends StatefulWidget {
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Location',
      style: optionStyle,
    ),
    Text(
      'Index 2: Fish',
      style: optionStyle,
    ),
    Text(
      'Index 2: Settings',
      style: optionStyle,
    ),
  ];

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.location_on_sharp),
              label: 'Location',
            ),
            BottomNavigationBarItem(
                label: 'Fish',
                icon: Container(
                  width: 30,
                  height: 30,
                  child: SvgPicture.asset(
                    "assets/icons/fish.svg",
                  ),
                )),
            BottomNavigationBarItem(
              label: 'Settings',
              icon: Icon(Icons.menu),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.green,
          onTap: _onItemTapped,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.fill)),
          padding:
              EdgeInsets.only(left: 50.0, right: 50.0, top: 40.0, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              ImageContainer(heightImage: 200, widthImage: 100),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Already a user?',
                    style: AlreadyAUserText,
                  ),
                ],
              ),
              LoginButton(
                loginmessage: 'LOGIN TO YOUR ACCOUNT',
                colour: headlinecolor,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmailLogin()),
                  );
                },
              ),
              DividerForOr(),
              LoginButton(
                loginmessage: 'CREATE NEW ACCOUNT',
                colour: loginbuttontextColor,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmailSignUp()),
                  );
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
