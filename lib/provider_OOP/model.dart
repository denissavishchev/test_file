import 'package:flutter/material.dart';

class Model with ChangeNotifier {
  double _time = 1.0;
  bool _isSwitched = true;

  double get time => _time;
  bool get isSwitched => _isSwitched;

  set time(double value) {
    _time = value;
    notifyListeners();
  }

  set isSwitched(bool value) {
    _isSwitched = value;
    notifyListeners();
  }

  void incrementCounter() {
    _time += 1.0;
    notifyListeners();
  }
}