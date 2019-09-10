import 'input_screen.dart';
import 'dart:math';

class CalculateBrain {
  CalculateBrain(this.hight, this.weight);
  final int hight;
  final int weight;
  double _bmi;

  String calcBmi() {
    _bmi = weight / pow(hight / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getrssult() {
    if (_bmi >= 25) {
      return 'overweight';
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "underweighg";
    }
  }

  String structure() {
    if (_bmi >= 25) {
      return 'you are higher than normal , you should do more exercise';
    } else if (_bmi > 18.5) {
      return "you have a Normal body weight , god job";
    } else {
      return "Your BMI quite low , you should eat more";
    }
  }
}
