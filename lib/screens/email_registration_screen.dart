import 'package:Machine_Test/constants/style_constants.dart';
import 'package:Machine_Test/custom_widgets/round_button.dart';
import 'package:Machine_Test/custom_widgets/text_field_login.dart';
import 'package:Machine_Test/screens/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class EmailSignUp extends StatefulWidget {
  @override
  State<EmailSignUp> createState() => _EmailSignUpState();
}

class _EmailSignUpState extends State<EmailSignUp> {
  String? firstName;
  String? lastName;
  String? password;
  String? rePassword;
  String? email;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String? value;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
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
                Text(
                  'Registration',
                  style: headlineR,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                LoginTextField(
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter First Name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    firstName = value;
                    print(firstName);
                  },
                  hint: 'First Name',
                ),
                LoginTextField(
                  onValidate: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Last Name';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    lastName = value;
                    print(lastName);
                  },
                  hint: 'Last Name',
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
                LoginTextField(
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
                      print(password);
                    });
                  },
                  hint: 'Enter Password',
                ),
                LoginTextField(
                  onValidate: (value) {
                    if (value == null) {
                      return "Password can't be empty";
                    } else if (value.length < 6) {
                      return "password should be atleast 6 characters";
                    } else if (value.length > 15) {
                      return "password should not be more than 15 characters";
                    }
                    if (password != rePassword) {
                      return 'MISMATCH FOUND IN PASSWORDS, PLEASE CHECK ';
                    }
                  },
                  onChanged: (value) {
                    setState(() {
                      rePassword = value;
                    });
                  },
                  hint: 'Re-Password',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .03,
                ),
                RoundButton(
                  buttonTitle: 'Register',
                  onPress: () {
                    if (_formKey.currentState!.validate()) {
                      if (password != null && (password == rePassword)) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpScreen(
                                    email: email, password: password)));
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 15.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
