import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class NewData with ChangeNotifier{
  Map<String, dynamic> _map = {};
  bool _error = false;
  String _errorMessage = '';

  Map<String, dynamic> get map => _map;
  bool get error => _error;
  String get errorMessage => _errorMessage;

  Future<void> get fetchData async {
    final response = await get(
      Uri.parse('https://pokeapi.co/api/v2/pokemon'),
    );

    if (response.statusCode == 200) {
      try {
        _map = jsonDecode(response.body);
        _error = false;
      }catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
    }else{
      _error = true;
      _errorMessage = 'Check internet connection';
      _map = {};
    }
    notifyListeners();
  }
  void initialValues() {
    _map = {};
    _error = false;
    _errorMessage = '';
    notifyListeners();
  }
}