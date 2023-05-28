import 'package:flutter/material.dart';
import 'package:test_file/screens/second_screen.dart';
import 'package:test_file/screens/third_screen.dart';


class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'First Screen',
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/second', arguments: 'SecondScreen2');
              },
              child: const Text('Second Screen'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pushNamed(context, '/third');
              },
              child: const Text('Third Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
