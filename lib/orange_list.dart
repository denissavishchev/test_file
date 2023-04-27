import 'package:flutter/material.dart';

class OrangeList extends StatefulWidget {
  const OrangeList({Key? key}) : super(key: key);

  @override
  State<OrangeList> createState() => _OrangeListState();
}

class _OrangeListState extends State<OrangeList> {

  int selected = 0;

  List images = [1, 2, 3, 4, 5,];

  List texts = [
    ['Forest Fox', 'Human', 'Earth'],
    ['Ice Light', 'Iceman', 'BarryIce'],
    ['Vasili', 'Cat', 'GreenValley'],
    ['Dread', 'Cyborg', 'IronPlanet'],
    ['Red Thing', 'Pirate', 'Ocean'],
  ];


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff2b2e2d),
              Color(0xff131416),
            ]
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Colors.transparent,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: IndexedStack(
                    index: selected,
                    children: List.generate(images.length,
                            (index) => AnimatedOpacity(
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 2000),
                                opacity: selected == index ? 1.0 : 0.0,
                                child: Image.asset('assets/images/${selected + 1}.jpg')),),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: images.length,
                      itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 500),
                          margin: const EdgeInsets.fromLTRB(25, 10, 25, 10),
                          height: 70,
                          decoration: BoxDecoration(
                             gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.bottomLeft,
                                colors: [
                                  selected == index ? const Color(0xffed3b1f) : const Color(0xff2b2e2d),
                                  selected == index ? const Color(0xffed3b1f) : const Color(0xff131416),
                                ]
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: selected == index ? Colors.white.withOpacity(0.2) : Colors.black,
                                blurRadius: 8,
                                offset: selected == index ? const Offset(-2, 2) : const Offset(-12, 12)
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Container(
                                width: 70,
                                height: 70,
                                clipBehavior: Clip.hardEdge,
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: selected == index ? Colors.white.withOpacity(0.2) : Colors.black,
                                          blurRadius: 4,
                                          offset: selected == index ? const Offset(4, 0) : const Offset(2, 0),
                                      ),
                                    ],
                                ),
                                child: Image.asset('assets/images/${images[index]}.jpg'),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(texts[index][0],
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'ufo'),),
                                        Text(texts[index][1],
                                          style: TextStyle(
                                              color: selected == index
                                                  ? Colors.white.withOpacity(0.7)
                                                  : const Color(0xffed3b1f).withOpacity(0.7),
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'ufo'),),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 50,),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(texts[index][2],
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'ufo'),),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
