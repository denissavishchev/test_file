import 'package:flutter/material.dart';

class TextFieldLesson extends StatefulWidget {
  const TextFieldLesson({Key? key}) : super(key: key);

  @override
  State<TextFieldLesson> createState() => _TextFieldLessonState();
}

class _TextFieldLessonState extends State<TextFieldLesson> {
  final _niceTextController = TextEditingController(text: 'admin');

  String text = 'Hello';
  String textValue = '';

  void _auth() {
    final login = _niceTextController.text;
    if (login == '1234') {
      setState(() {
        text = 'Success!';
      });
    } else {
      setState(() {
        text = 'Wrong';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          width: 300,
          height: 600,
          color: Colors.grey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),


                child: TextField(
                  onChanged: (val) {
                    setState(() {
                      textValue = val;
                    });
                  },
                  controller: _niceTextController,
                  style:
                      const TextStyle(color: Colors.deepPurple, fontSize: 22),
                  cursorColor: Colors.deepOrange,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    isCollapsed: true,
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 30,
                    ),
                    suffixIcon: const Icon(
                      Icons.ac_unit,
                      color: Colors.white,
                      size: 30,
                    ),
                    hintText: 'Search',
                    hintStyle: TextStyle(
                      fontSize: 22,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18),
                      ),
                      borderSide: BorderSide(
                          color: Colors.green.withOpacity(0.4), width: 3),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18),
                      ),
                      borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.1), width: 2),
                    ),
                  ),
                ),


              ),
              Text(text),
              const SizedBox(
                height: 10,
              ),
              Text('TextField text is: $textValue'),
              ElevatedButton(onPressed: _auth, child: const Text('Push me')),
              const SizedBox(
                height: 200,
              )
            ],
          ),
        ),
      ),
    );
  }
}
