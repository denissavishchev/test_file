import 'package:flutter/material.dart';

class PlanetPage extends StatelessWidget {
  const PlanetPage({Key? key}) : super(key: key);

  static String planetImage = '';
  static String planetName = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.transparent,
            body: Center(
              child: SizedBox(
                width: 200,
                height: 400,
                child: Column(
                  children: [
                    ElevatedButton(
                        onPressed: (){
                          Navigator.of(context).pop();
                        },
                        child: const Text('Back')),
                    const SizedBox(height: 20,),
                    Text(planetName, style: const TextStyle(color: Colors.white, fontSize: 28),),
                    Image.asset('assets/images/$planetImage.png')
                  ],
                ),
              ),
            )));
  }
}

