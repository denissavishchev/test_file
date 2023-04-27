import 'package:flutter/material.dart';

class Schedule with ChangeNotifier {
  double _time = 0.5;

  double get time => _time;

  set time(double value) {
    _time = value;
    notifyListeners();
  }
}