import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class CustomSliderWidget extends StatelessWidget {
  CustomSliderWidget({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    return Slider.adaptive(
        min: 0,
        max: 100,
        value: model.time,
        divisions: 100,
        activeColor: Colors.deepPurple,
        inactiveColor: Colors.deepPurple.withOpacity(0.3),
        onChanged: (double value) {
          model.time = value;
        });
  }
}
