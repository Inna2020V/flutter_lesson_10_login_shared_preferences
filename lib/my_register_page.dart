import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyRegisterPage extends StatefulWidget {
  const MyRegisterPage({Key? key}) : super(key: key);

  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  final _formKey = GlobalKey<FormState>();

  final String _username = '';
  final String _password = '';
  final String _email = '';

  Future<void> _save(String username, String email, String password) async {
    var _pref = await SharedPreferences.getInstance();
    _pref.setString('username', username);
    _pref.setString('password', password);
    _pref.setString('email', email);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Register",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Username',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your name';
                          }
                        }),
                    const SizedBox(height: 20),
                    TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Password',
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your password';
                          }
                        }),
                    const SizedBox(height: 20),
                    TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-mail',
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your E-mail';
                          }
                          if (!value.contains('@'))
                            // ignore: curly_braces_in_flow_control_structures
                            return 'Enter correct E-mail';
                        }),
                    const SizedBox(height: 25),
                    MaterialButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _save(_username, _email, _password);
                          Navigator.pop(context);
                        }
                      },
                      child: const Text('SAVE'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
