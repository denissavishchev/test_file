import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_file/provider_OOP/CustomSliderWidget.dart';
import 'package:test_file/provider_OOP/CustomSwitchWidget.dart';
import 'package:test_file/provider_OOP/model.dart';

class BeginPage extends StatelessWidget {
   BeginPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Model(),
      child: Consumer<Model>(
        builder: (context, model, _) => Scaffold(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 50,
                height: 30,
                decoration: const BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.all(Radius.circular(10),),
                ),
                child: Center(
                  child: Text(
                    '${model.time}', style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32),
                child: CustomSliderWidget(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: model.isSwitched ? Colors.deepPurple : Colors.deepOrange,
                      borderRadius: const BorderRadius.all(Radius.circular(10),),
                    ),
                  ),
                  CustomSwitchWidget()
                ],
              ),
              ElevatedButton(
                  onPressed: () => Provider.of<Model>(context, listen: false).incrementCounter(),
                  child: const Text('Press'))
            ],
          ),
        ),
      ),
    );
  }
}
