import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:async';


class SharedPreferences extends StatefulWidget {
  const SharedPreferences({super.key});


  @override
  _SharedPreferencesState createState() => _SharedPreferencesState();

}

class _SharedPreferencesState extends State<SharedPreferences> {
  int _counter = 0;

  void _incrementCounter() async{
    setState(() {
      _counter++;
    });

    // var prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}