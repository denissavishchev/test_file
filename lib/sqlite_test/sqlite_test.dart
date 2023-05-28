import 'package:flutter/material.dart';
import 'package:test_file/sqlite_test/user_model.dart';

import 'crud_helper.dart';


class SqliteTest extends StatefulWidget {
  const SqliteTest({super.key});

  @override
  State < SqliteTest > createState() => _SqliteTestState();
}

class _SqliteTestState extends State < SqliteTest > {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  late UserModel _currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: CrudHelper.getUsers(),
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      print(snapshot);
                      // _userNameController.text = snapshot.data![1].userName!;
                      // _emailController.text = snapshot.data![0].email!;
                      // _passwordController.text = snapshot.data![0].password!;
                      // _currentUser = snapshot.data![0];
                    }
                    return Column(
                      children: [
                        _userName(),
                        const SizedBox(height: 10, ),
                        _email(),
                        const SizedBox(height: 10, ),
                        _password(),
                        const SizedBox(height: 40, ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex:1, child: _createUser()),
                            const SizedBox(width: 10,),
                            Expanded(flex:1, child: _updateUser()),
                            const SizedBox(width: 10,),
                            Expanded(flex:1, child: _deleteUser())
                          ],
                        )
                      ],
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _userName() => TextFormField(
      controller: _userNameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Username',
      )
  );

  Widget _email() => TextFormField(
      controller: _emailController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Email',
      )
  );

  Widget _password() => TextFormField(
      controller: _passwordController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Password',
      )
  );

  Widget _createUser() => MaterialButton(
    onPressed: () async {
      UserModel user = UserModel(
          userName: _userNameController.text,
          email: _emailController.text,
          password: _passwordController.text
      );
      await CrudHelper.createUser(user);
      setState(() {});
    },
    color: Colors.green,
    height: 50,
    child: const Text('Create', style: TextStyle(color: Colors.white), ),
  );

  Widget _updateUser() => MaterialButton(
    onPressed: () async {
      _currentUser.userName = _userNameController.text;
      _currentUser.email = _emailController.text;
      _currentUser.password = _passwordController.text;
      await CrudHelper.updateUser(_currentUser);
      setState(() {});
    },
    color: Colors.blue,
    height: 50,
    child: const Text('Update', style: TextStyle(color: Colors.white), ),
  );

  Widget _deleteUser() => MaterialButton(
    onPressed: () async {
      await CrudHelper.deleteUser(_currentUser.id!);
      _userNameController.clear();
      _emailController.clear();
      _passwordController.clear();
      setState(() {});
    },
    color: Colors.redAccent,
    height: 50,
    child: const Text('Delete', style: TextStyle(color: Colors.white), ),
  );
}