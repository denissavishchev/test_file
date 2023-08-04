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

  Future<Data> get fetchData async {
    final response = await get(
      Uri.parse('https://api.magicthegathering.io/v1/cards'),
    );
    print('status ${response.statusCode}');
    print('body ${response.body}');

    if (response.statusCode == 200) {
      Data data = Data.fromJson(jsonDecode(response.body));

      data.cards.map((e) => print('name: ${e.name}')).toList();
      return data;
      try {
        _map = jsonDecode(response.body);
        _error = false;
      }catch (e) {
        _error = true;
        _errorMessage = e.toString();
        _map = {};
      }
    }else{
      throw Exception('Failed to load album');
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

class Data {
   late List<Cards> cards;

   Data({required this.cards});

  Data.fromJson(Map<String, dynamic> json) {
    cards = <Cards>[];
    for (var e in (json['cards'] as List)) {
      cards.add(Cards.fromJson(e));
    }
  }
}

class Cards {
  late String name;
  late String manaCost;
  late String type;

  Cards({required this.name, required this.manaCost, required this.type});

  Cards.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    manaCost = json['manaCost'];
    type = json['type'];
  }
}