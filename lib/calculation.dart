import 'dart:math';

class CalculationBrain {
  final int height;
  final int weight;

  double _bmi;

  CalculationBrain({this.height, this.weight});

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpetition() {
    if (_bmi >= 25.0) {
      return 'Try to excercise more !';
    } else if (_bmi > 18.5) {
      return 'You have normal weight. Good Job!';
    } else {
      return 'You have lower weight. Eat More';
    }
  }
}
