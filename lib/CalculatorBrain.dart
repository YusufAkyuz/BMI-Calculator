import 'dart:math';



class CalculatorBrain {

  CalculatorBrain({required this.height, required this.weight});

  final int height;
  final int weight;
  double _BMI = 0;

  String calculateBMI() {
    _BMI = weight / pow(height/100, 2);
    return _BMI.toStringAsFixed(1);
  }
  String getResultText() {
    if(_BMI > 30) {
      return 'Obesity';
    }else if(_BMI > 25) {
      return 'Overweight';
    }else if(_BMI > 18.5) {
      return 'Healthy Weight';
    }else{
      return 'Underweight';
    }
  }
  String getRecommendText() {
    if(_BMI > 30) {
      return 'You need to see a doctor.';
    }else if(_BMI > 25) {
      return 'You need to lose weight.';
    }else if(_BMI > 18.5) {
      return 'You have a healthy body.';
    }else{
      return 'You need to gain weight.';
    }
  }
}