import 'package:flutter/material.dart';
import '../Constant.dart';
import '../Components/Botton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'SavedResults.dart';
import 'package:bmi_calculator/DatabaseHelper.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {required this.bmiResult,
      required this.resultText,
      required this.resultRecommendText});

  final bmiResult;
  final resultText;
  final resultRecommendText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0b0d21),
        title: Text(
          'BMI Calculator',
          style: AppStyles.bodyMedium,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              child:
                  Center(child: Text('Your Result', style: AppStyles.keyTitle)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF2E2F50),
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.fromLTRB(10, 0, 10, 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(resultText, style: AppStyles.greenTextStyle),
                  Text(
                    bmiResult,
                    style: AppStyles.BMIResultStyle,
                  ),
                  Text(
                    resultRecommendText,
                    style: AppStyles.BMIResultTextStyle,
                  ),
                  Column(
                    children: <Widget>[
                      Botton(
                        text: 'Go Back',
                        onPrees: () {
                          Navigator.pop(context);
                        },
                      ),
                      Botton(
                        text: 'Save the Result',
                        onPrees: () {
                          //DataBase

                          DatabaseHelper helper = DatabaseHelper();
                          helper.insertResult(bmiResult, resultText, resultRecommendText);

                          Fluttertoast.showToast(
                              msg: 'Saved',
                              toastLength: Toast.LENGTH_LONG,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Color(0xFF131638),
                              textColor: Colors.white,
                              fontSize: 20);
                        },
                      ),
                      Botton(
                        text: 'Show the Results',
                        onPrees: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return SavedResults();
                          }));
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
