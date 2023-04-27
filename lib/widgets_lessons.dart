import 'dart:math';

import 'package:flutter/material.dart';

class WidgetLessons extends StatefulWidget {
  const WidgetLessons({Key? key}) : super(key: key);

  @override
  State<WidgetLessons> createState() => _WidgetLessonsState();
}

class _WidgetLessonsState extends State<WidgetLessons> {

  TimeOfDay time = const TimeOfDay(hour: 10, minute: 30);

  bool isHidden = true;

  void hideAppear() {
    setState(() {
      isHidden = !isHidden;
    });
  }
  int currentStep = 0;

  RangeValues _rangeValues = const RangeValues(40, 80);

  @override
  Widget build(BuildContext context) {

    final hours = time.hour.toString().padLeft(2, '0');
    final minutes = time.minute.toString().padLeft(2, '0');

    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 80,),
          RangeSlider(
              values: _rangeValues,
              min: 0,
              max: 100,
              divisions: 20,
              labels: RangeLabels(
                _rangeValues.start.round().toString(),
                _rangeValues.end.toString(),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _rangeValues = values;
                });
              }),
          Stepper(
            type: StepperType.vertical,
              currentStep: currentStep,
              onStepTapped: (index) {
                setState(() =>
                  currentStep = index);
              },
              onStepContinue: () {
              setState(() {
                currentStep += 1;
              });
              },
              onStepCancel: () {
              setState(() {
                currentStep -= 1;
              });
              },
              steps: [
                Step(
                  isActive: currentStep >= 0,
                    title: const Icon(Icons.add_circle),
                    subtitle: const Text('wiu wiu'),
                    content: const Text('Step 1'),
                ),
                Step(
                    isActive: currentStep >= 1,
                    title: const Icon(Icons.back_hand),
                    content: const Text('Step 2')),
                Step(
                    isActive: currentStep >= 2,
                    title: const Icon(Icons.camera),
                    content: const Text('Step 3')),
                Step(
                    isActive: currentStep >= 3,
                    title: const Icon(Icons.data_exploration_outlined),
                    content: const Text('Step 4')),
              ]),
          const SizedBox(height: 20,),
          RichText(
              text: const TextSpan(
                text: 'Hello', style: TextStyle(color: Colors.deepOrange),
                children: [
                  TextSpan(text: 'World', style: TextStyle(color: Colors.green)),
                  TextSpan(text: 'Big', style: TextStyle(color: Colors.indigo)),
                  TextSpan(text: 'World', style: TextStyle(color: Colors.indigo))
                ]
              )),
          const SizedBox(height: 20,),
          Text(
            '$hours:$minutes'
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
              onPressed: () async{
                TimeOfDay? newTime = await showTimePicker(
                    context: context,
                    initialTime: time);
                if (newTime == null) return;
                setState(() {
                  time = newTime;
                });
              },
              child: const Text('Select Time')),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Visibility(
                visible: isHidden,
                child: ElevatedButton(
                    onPressed: (){
                      hideAppear();
                    },
                    child: const Text('One')),
              ),
              Visibility(
                visible: !isHidden,
                child: ElevatedButton(
                    onPressed: (){
                      hideAppear();
                    },
                    child: const Text('Two')),
              ),
            ],
          )
        ],
      ),
    );
  }
}
