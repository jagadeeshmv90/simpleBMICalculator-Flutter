import 'dart:math';

class BMIBrain{
  BMIBrain({this.userHeight, this.userWeight});
  final int userHeight;
  final int userWeight;
  double _bmi;

  String getBMI(){
    _bmi = userWeight / pow(userHeight/100, 2);
    return _bmi.toStringAsFixed(2);
  }

  String getResults(){
    if(_bmi >= 25) {
    return 'OverWeight';
    } else if (_bmi > 18.5) {
    return 'Normal';}
    else {
    return 'UnderWeight';}
  }

  String getOpinion(){
    if(_bmi >= 25) {
    return 'Some people live to eat, some others eat to live. You\'re in the first category';
    } else if (_bmi > 18.5) {
    return 'Perfect Body! Kudos on keeping up fitness.';}
    else {
    return 'Some people live to eat, some others eat to live. You need to eat more to live longer.';}
  }

}