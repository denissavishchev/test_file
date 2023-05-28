import 'package:flutter/material.dart';
import 'package:test_file/screens/third_screen.dart';

class SecondScreen extends StatelessWidget {

  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final arguments = (ModalRoute.of(context)?.settings.arguments);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          arguments.toString(),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/third');
              },
              child: const Text('Third Screen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
