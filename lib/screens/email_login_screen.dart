import 'package:Machine_Test/constants/style_constants.dart';
import 'package:Machine_Test/custom_widgets/image_box.dart';
import 'package:Machine_Test/custom_widgets/round_button.dart';
import 'package:Machine_Test/custom_widgets/text_field_login.dart';
import 'package:Machine_Test/screens/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:form_field_validator/form_field_validator.dart';

class EmailLogin extends StatefulWidget {
  const EmailLogin({Key? key}) : super(key: key);
  @override
  State<EmailLogin> createState() => _EmailLoginState();
}

class _EmailLoginState extends State<EmailLogin> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  String? email;
  String? password;
  bool sight = true;
  bool showSpinner = false;

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
                      child: ImageContainer(heightImage: 150, widthImage: 100)),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Login to your Account',
                    style: Headline3,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  LoginTextField(
                    keyboard: TextInputType.emailAddress,
                    onValidate: MultiValidator([
                      RequiredValidator(errorText: "Email is required"),
                      EmailValidator(errorText: "Not a valid email")
                    ]),
                    onChanged: (value) {
                      setState(() {
                        email = value;
                      });
                    },
                    hint: 'Email',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  OtpTextField(
                    visibility: sight,
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
                    onValidate: (value) {
                      if (value == null) {
                        return "Password can't be empty";
                      } else if (value.length < 6) {
                        return "password should be atleast 6 characters";
                      } else if (value.length > 15) {
                        return "password should not be more than 15 characters";
                      }
                    },
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                    hint: 'Password',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .03,
                  ),
                  RoundButton(
                    buttonTitle: 'Login',
                    onPress: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          showSpinner = true;
                        });
                      }
                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email.toString(),
                            password: password.toString());
                        setState(() {
                          showSpinner = false;
                        });
                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        }
                      } catch (e) {
                        print(e);
                      }
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
