import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:test_file/state_management/schedule.dart';

class ChartState extends StatelessWidget {
   ChartState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Schedule>(
      builder: (context, schedule, _) => PieChart(
        dataMap: {
          "Flutter": schedule.time * 10,
          "React": 3,
          "Xamarin": 2,
          "Ionic": 2,
        },),
    );
  }
}
