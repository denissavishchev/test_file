import 'dart:ui';
import 'package:flutter/material.dart';

class GlassMorph extends StatelessWidget {
  const GlassMorph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png')
            )
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(30)),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.transparent,
              child: Stack(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 4,
                      sigmaY: 4,
                    ),
                    child: Container(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.13),
                      ),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.white.withOpacity(0.15),
                            Colors.white.withOpacity(0.05),
                          ]),
                    ),
                  ),
                  const Center(
                    child: Text(
                      'demo',
                      style: TextStyle(
                          color: Colors.pink,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
