import 'package:flutter/material.dart';

class FormValidationPage extends StatelessWidget {
  FormValidationPage({Key? key}) : super(key: key);

  final sunKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          color: Colors.indigo.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(20))
        ),
        child: Form(
          key: sunKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('Hello'),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: const InputDecoration(
                  labelText: 'Name'
                ),
                validator: (value){
                  if(value == '' || !RegExp(r'^[a-z A-Z]+$').hasMatch(value!)){
                    return 'Enter correct name';
                  }else{
                    return null;
                  }
                },
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                maxLength: 30,
                decoration: const InputDecoration(
                    labelText: 'Password'
                ),
                validator: (value){
                  if(value!.length < 8){
                    return 'Password is too short';
                  } else{
                    return null;
                  }
                },
              ),
              TextButton(
                  onPressed: (){
                    if(sunKey.currentState!.validate()){
                      print('OK');
                    }else{
                      print('Check fields');
                    }
                  },
                  child: const Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
