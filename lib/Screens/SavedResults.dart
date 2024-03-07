import 'package:bmi_calculator/DatabaseHelper.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/Constant.dart';

class SavedResults extends StatefulWidget {
  const SavedResults({super.key});

  @override
  State<SavedResults> createState() => _SavedResultsState();
}

class _SavedResultsState extends State<SavedResults> {
  String? _bmiResult;
  String? _resultText;
  String? _resultRecommendText;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  late List<Map<String, dynamic>> list;

  Future<void> _loadData() async {
    DatabaseHelper dbHelper = DatabaseHelper();
    dbHelper.initDatabase();
    List<Map<String, dynamic>> results = await dbHelper.getResults();
    setState(() {
      list = results;
    });
  }



  @override
  Widget build(BuildContext context) {
    _loadData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0b0d21),
        title: Text(
          'BMI Calculator',
          style: AppStyles.bodyMedium,
        ),
      ),
      body: Column(
        children: <Widget>[
          _bmiResult = list[0]['_bmiResult'],
          Text(_bmiResult != null ? '$_bmiResult' : 'No BMI result saved'),
        ],
      ),
    );
  }
}
