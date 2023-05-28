import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  final String screenTitle;
  const ThirdScreen({Key? key, required this.screenTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          screenTitle
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 'back button');
              },
              child: const Text('Back'),
            ),
          ],
        ),
      ),
    );
  }
}
