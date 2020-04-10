import 'dart:math';

class CalculatorBrain {
  CalculatorBrain({this.height, this.weight});
  final int weight;
  final int height;
  double _bmi;

  String calculateBMI() {
    _bmi = (weight / pow((height / 100), 2));
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return "Your BMI score is awful sir! You need to lose weight you fat prick...";
    } else if (_bmi > 18.5) {
      return "Your BMI score is good sir! Keep living just as you are and you will live a healthy and comforable life";
    } else {
      return "Your BMI score is awful sir! You need to eat some food and pack some pounds onto your skeleton. DRESS THE SKELETON!!!";
    }
  }
}
