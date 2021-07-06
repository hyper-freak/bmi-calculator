import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bmi/screens/calbmi.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        accentColor: Color(0xFF56D0DB),
      ),
      home: AnimatedSplashScreen(
        splash:Image.asset('lib/images/logo.png'),
        nextScreen: HomePage(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: Colors.white,
        duration: 2500,
       )
    );
  }
}



