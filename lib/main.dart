import 'package:Machine_Test/screens/splach_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const Material(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: const TextTheme(
          headline1: TextStyle(
              fontFamily: 'PTSans',
              fontSize: 50.0,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic),
          headline2: TextStyle(
              fontFamily: 'PTSans', fontSize: 40, fontStyle: FontStyle.italic),
          headline3: TextStyle(
              fontFamily: 'PTSans',
              fontSize: 36,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic),
          bodyText1: TextStyle(fontSize: 20, fontFamily: 'PTSans'),
        ),
      ),
      home: const Scaffold(body: Spalach()),
    );
  }
}
