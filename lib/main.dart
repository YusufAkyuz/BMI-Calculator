import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Screens/InputPage.dart';
import 'Screens/ResultPage.dart';
import 'Components/Botton.dart';


void main() async{
  runApp(BMICalculator());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class BMICalculator extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0b0d21),
        scaffoldBackgroundColor: Color(0xff161a42),
      ),/*
        textTheme: TextTheme(
          bodySmall: TextStyle(
            color: Colors.white,
            fontSize: 15
          ),
          bodyMedium: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),
            bodyLarge: TextStyle(
                color: Colors.white,
                fontSize: 25
            )
        )
      ),*/
      home: InputPage(),
    );
  }
}



