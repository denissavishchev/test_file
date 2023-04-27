import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_file/state_management/schedule.dart';
import 'package:test_file/state_management/slider_state.dart';

import 'chart_stete.dart';

class StateManagement extends StatelessWidget {
  const StateManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Schedule(),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(32),
              child: ChartState(),
            ),
            Padding(
              padding: const EdgeInsets.all(32),
              child: SliderState(),
            ),
          ],
        ),
      ),
    );
  }
}
