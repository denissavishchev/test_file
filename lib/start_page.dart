import 'package:flutter/material.dart';
import 'package:test_file/list_of_planets.dart';
import 'package:test_file/planet_page.dart';
import 'constants.dart';

class StartPage extends StatefulWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: SizedBox(
                width: 200,
                height: MediaQuery.of(context).size.height,
                child: ListOfPlanets(
                  onPlanet: (String names, String planets) {
                    print(names);
                    print(planets);
                    PlanetPage.planetImage = planets;
                    PlanetPage.planetName = names;
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PlanetPage()));
                  },
                ),
              ),
            )));
  }
}
