import 'package:flutter/material.dart';

import 'neu_box_button.dart';

class MediaQueryTest extends StatelessWidget {
  const MediaQueryTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column( 
                  children: List.generate( 
                    100,
                        (int index) => NeuBoxButton(
                      onTap: () {},
                      child: Image.asset('assets/images/2venus.png'),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    100,
                        (int index) => NeuBoxButton(
                      onTap: () {},
                      child: Image.asset('assets/images/5jupiter.png'),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(
                    100,
                        (int index) => NeuBoxButton(
                      onTap: () {},
                      child: Image.asset('assets/images/4mars.png'),
                    ),
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}
