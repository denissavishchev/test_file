import 'package:flutter/material.dart';
// import 'package:test_file/provider_OOP/begin_page.dart';
import 'package:test_file/provider_json/main_page.dart';
import 'package:test_file/sqlite_test/sqlite_test.dart';
// import 'package:test_file/provider_json/pokemon_page.dart';
// import 'package:test_file/start_page.dart';
// import 'package:test_file/state_management/state_management.dart';
// import 'package:test_file/widgets_lesons_two.dart';
// import 'package:test_file/widgets_lessons.dart';
// import 'package:test_file/staggered_animation.dart';
// import 'adaptive_responsive_layout_widget.dart';
// import 'orange_list.dart';
// import 'auth.dart';
// import 'dna.dart';
// import 'glass_morph.dart';
// import 'media_query.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: SqliteTest());
  }
}




