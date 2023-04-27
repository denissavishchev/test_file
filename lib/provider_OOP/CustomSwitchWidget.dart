import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model.dart';

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = Provider.of<Model>(context);
    return Switch.adaptive(
        value: model.isSwitched,
        activeColor: Colors.deepOrange,
        inactiveTrackColor: Colors.deepOrange.withOpacity(0.3),
        inactiveThumbColor: Colors.deepOrange.withOpacity(0.3),
        onChanged: (bool value) {
          model.isSwitched = value;
        });
  }
}
