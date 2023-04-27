import 'package:flutter/material.dart';
import 'constants.dart';

class ListOfPlanets extends StatelessWidget {
  const ListOfPlanets({Key? key, required this.onPlanet}) : super(key: key);

  final Function(String names, String planets) onPlanet;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: planets.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => onPlanet(names[index], planets[index]),
            child: Stack(
              children: [
                Image.asset('assets/images/${planets[index]}.png'),
                Positioned(
                  top: 5,
                  left: 0,
                  child: Text(
                    names[index],
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

