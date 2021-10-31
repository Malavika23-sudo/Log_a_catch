import 'package:Machine_Test/constants/style_constants.dart';
import 'package:Machine_Test/custom_widgets/image_box.dart';
import 'package:Machine_Test/custom_widgets/round_button.dart';
import 'package:Machine_Test/custom_widgets/text_field_login.dart';
import 'package:Machine_Test/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_auth/email_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OtpScreen extends StatefulWidget {
  String? email;
  String? password;
  OtpScreen({this.email, this.password});
  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  bool sight = true;
  String? otp;
  final _auth = FirebaseAuth.instance;
  EmailAuth emailAuth = new EmailAuth(sessionName: "Sample session");
  final _formKey = GlobalKey<FormState>();
  bool showSpinner = false;

  void initState() {
    super.initState();
    sendOtp();
  }

  void sendOtp() async {
    print('otp send');
    bool result = await emailAuth.sendOtp(
        recipientMail: widget.email.toString(), otpLength: 6);
  }

  bool varifyOtp() {
    print('varified');
    return emailAuth.validateOtp(
        recipientMail: widget.email.toString(), userOtp: otp.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/background.png'),
                    fit: BoxFit.fill)),
            padding: EdgeInsets.only(left: 30.0, right: 30.0, top: 40.0),
            child: Form(
              key: _formKey,
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
                    ],
                  ),
                  Expanded(
                      child: ImageContainer(
                    heightImage: 200,
                    widthImage: 150,
                  )),
                  Text(
                    'Please varify your Email',
                    style: Headline3,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .07,
                  ),
                  Container(
                    height: 50.0,
                    width: 300.0,
                    color: Colors.white54,
                    child: Row(
                      children: [
                        Text('        ${widget.email.toString()}'),
                        Spacer(
                          flex: 10,
                        ),
                        GestureDetector(
                          child: Text('Resend OTP', style: linkText),
                          onTap: () {
                            sendOtp();
                          },
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  OtpTextField(
                    // onValidate: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Enter OTP';
                    //   }
                    //   return null;
                    // },
                    onChanged: (value) {
                      setState(() {
                        otp = value;
                      });
                    },
                    hint: 'Enter OTP',
                    maximumLength: 6,
                    visibility: sight,
                    keyboard: TextInputType.number,
                    eyeIcon: IconButton(
                      icon: Icon(
                        sight ? Icons.lock : Icons.remove_red_eye,
                      ),
                      onPressed: () {
                        setState(() {
                          sight = !sight;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  RoundButton(
                    buttonTitle: 'varify',
                    onPress: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          showSpinner = true;
                        });
                      }
                      try {
                        final newUser =
                            await _auth.createUserWithEmailAndPassword(
                                email: widget.email.toString(),
                                password: widget.password.toString());
                        setState(() {
                          showSpinner = false;
                        });
                        if (newUser != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        } else {}
                      } catch (e) {
                        print('e: $e');
                      }

                      // try {
                      //   var res = varifyOtp();
                      //   print('Response $res');
                      // if (res) {
                      //   final newUser =
                      //       await _auth.createUserWithEmailAndPassword(
                      //           email: widget.email.toString(),
                      //           password: widget.password.toString());
                      //   if (newUser != null) {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => EmailLogin()));
                      //   }
                      //   print('Otp varified');
                      // } else {
                      //   print('Not varified');
                      // }
                      //   } catch (e) {
                      //     print(e);
                      //   }
                    },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
