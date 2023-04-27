import 'package:flutter/material.dart';

class WidgetsLessonTwo extends StatefulWidget {
  const WidgetsLessonTwo({Key? key}) : super(key: key);

  @override
  State<WidgetsLessonTwo> createState() => _WidgetsLessonTwoState();
}

class _WidgetsLessonTwoState extends State<WidgetsLessonTwo> {

  void _showDatePicker() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2025));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            ElevatedButton(
                onPressed: _showDatePicker,
                child: const Text('Choose a Day'))
          ],
        ),
      ),
    );
  }
}
