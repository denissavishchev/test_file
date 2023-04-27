import 'package:flutter/material.dart';


class SimpleCustom extends StatelessWidget {
  const SimpleCustom({Key? key,
    required this.color,
    required this.text}) : super(key: key);

  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(20),),
      ),
      child: Center(child: Text(text)),
    );
  }
}

