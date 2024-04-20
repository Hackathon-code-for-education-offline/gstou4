import 'package:flutter/material.dart';
import 'package:gstou4/activities/authentication/registration_page.dart';

import 'package:gstou4/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String email = '';
  String password = '';

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Вход")),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  onChanged: (value) {setState(() {
                    email = value;
                  });},
                ),
                TextFormField(
                  obscureText: true,
                  onChanged: (value) {setState(() {
                    password = value;
                  });},
                ),
                Row(
                  children: [
                    const Text("Ещё нет аккаунта?"),
                    TextButton(onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const RegistrationPage())
                      );
                    }, child: const Text("Регистрация"))
                  ],
                ),
                TextButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      dynamic response = await _auth.signIn(email, password);
                      if (response == null) {
                        print("sasd");
                      }
                    }
                  },
                  child: const Text("Войти")),
                TextButton(
                  onPressed: () async {
                    dynamic response = await _auth.signInAnon();
                    print(response.uid.toString());
                  },
                  child: const Text("Войти как гость"))
              ],
            )
          ),

        ],
      ),
    );
  }
}

