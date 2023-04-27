import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_file/state_management/schedule.dart';

class SliderState extends StatelessWidget {
  SliderState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final schedule = Provider.of<Schedule>(context);
    return Slider(
        value: schedule.time,
        onChanged: (value) {
          schedule.time = value;
        }
    );
  }
}
