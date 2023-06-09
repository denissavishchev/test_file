import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  const Buttons({Key? key,
    required this.color,
    required this.frameColor,
    required this.onPress,
    required this.child}) : super(key: key);

  final Color color;
  final Color frameColor;
  final Function() onPress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
        child: Container(
          width: 50,
          height: 50,
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 3, color: frameColor),
          ),
          child: child,
        ));
  }
}
