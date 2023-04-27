import 'package:flutter/material.dart';


class AnimationWidget extends StatelessWidget {

  late final AnimationController controller;

  AnimationWidget({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (context, child) {
          return child ?? const SizedBox.shrink();
        },
        child: Container(
        width: 100,
      height: 200,
      color: Colors.pink,
    ),
        );
  }
}

