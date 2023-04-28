import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_file/provider_json/pokemon_page.dart';

import 'model.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => NewData(),
        builder: (context, child) {
          return PokemonPage();
        },
      ),
    );
  }
}
