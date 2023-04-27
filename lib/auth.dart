import 'package:flutter/material.dart';
import 'constants.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {

  final _loginTextController = TextEditingController(text: 'admin');
  final _passwordTextController = TextEditingController(text: 'admin');
  String text = '';
  var textColor = Colors.transparent;
  final successColor = Colors.green;
  final errorColor = Colors.red;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;
    if (login == 'admin' && password == 'admin') {
      // setState(() {
      //   Navigator.push(
      //     context,
      //     MaterialPageRoute(builder: (context) => const MainScreenWidget()),
      //   );
      // });
      setState(() {
        text = 'Success!';
        textColor = successColor;
      });
    }
    else {
      setState(() {
        text = 'Wrong Login or Password!';
        textColor = errorColor;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.cover),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(40),
            child: AppBar(
              backgroundColor: kBlack.withOpacity(0.6),
              title: Container(
                height: 40,
                // color: Colors.indigo,
                alignment: Alignment.center,
                child: const Text('Login or ...',
                  style: TextStyle(
                    fontSize: 32,
                    color: kWhite,
                  ),),
              ),
            ),
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: kBlue.withOpacity(0.7)),
              boxShadow: [
                BoxShadow(
                  color: kGrey.withOpacity(0.4),
                  // blurRadius: 8,
                  // offset: const Offset(-5, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70,),
                Text(text, style: TextStyle(color: textColor, fontSize: 18),),
                const SizedBox(height: 20,),
                const Text('Username:', style: textStyle,),
                TextField(
                  controller: _loginTextController,
                  decoration: textFieldDecoration,
                  style: const TextStyle(color: Colors.white),
                  cursorColor: kBlue,
                ),
                const SizedBox(height: 20,),
                const Text('Password:', style: textStyle,),
                TextField(
                  obscureText: true,
                  controller: _passwordTextController,
                  decoration: textFieldDecoration,
                  style: const TextStyle(color: Colors.white),
                  cursorColor:kBlue,
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: _auth,
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(kBlack.withOpacity(0.8)),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 15, vertical: 5))
                        ),
                        child: const Text('Login')),
                    const SizedBox(width: 30,),
                    ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(kBlack.withOpacity(0.8)),
                            foregroundColor: MaterialStateProperty.all(Colors.white),
                            textStyle: MaterialStateProperty.all(
                              const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal: 10, vertical: 5))
                        ),
                        child: const Text('Register')),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
  }
}
