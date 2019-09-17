import 'dart:math';

class CalculatorBrain {
  final int weight;
  final int height;

  CalculatorBrain({this.height, this.weight});

  double _bmi;
  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OverWeighted';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeighted';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to bite into a diet';
    } else if (_bmi > 18.5) {
      return 'You have a normal weight. Good done!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
