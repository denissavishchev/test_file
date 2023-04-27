import 'package:flutter/material.dart';

const kBlack = Color(0xff1c1920);
const kDarkGrey = Color(0xff484757);
const kBlue = Color(0xff9da8c0);
const kGrey = Color(0xffdbdfea);
const kWhite = Color(0xffeff5fa);

const textStyle = TextStyle(
  fontSize: 16,
  color: Colors.white,
);

const textFieldDecoration = InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kBlue, width: 1),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: kBlue, width: 2),
  ),
  border: OutlineInputBorder(),

  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
  isCollapsed: true,
);








final decorations = BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.deepOrange,
                    border: Border.all(width: 5,color: Colors.green));

final List planets = ['1mercury', '2venus', '3earth', '4mars', '5jupiter', '6saturn', '7uranus', '8neptune'];
final List names = ['Mercury', 'Venus', 'Earth', 'Mars', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'];

