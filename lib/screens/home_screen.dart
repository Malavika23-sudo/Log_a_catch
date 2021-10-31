import 'package:Machine_Test/constants/style_constants.dart';
import 'package:Machine_Test/custom_widgets/home_screen_button.dart';
import 'package:Machine_Test/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void initState() {
    getCurrentUser();
  }

  void getCurrentUser() {
    final User? user = _auth.currentUser;
    final uid = user!.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background.png'),
                  fit: BoxFit.fill)),
          padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BackButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.white,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * .4),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      onPressed: () {
                        _auth.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child: Text(
                        'Log Out',
                        style: LogoutButton,
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .1,
              ),
              SignupButton(
                text: 'Log a Fishing Spot',
              ),
              SignupButton(
                text: 'View my Spot',
              ),
              SignupButton(
                text: 'View my Catches',
              ),
              SignupButton(
                text: 'my Gear',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
