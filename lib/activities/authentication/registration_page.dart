import 'package:flutter/material.dart';

import 'package:gstou4/services/auth.dart';


class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String username = '';
  String email = '';
  String password = '';


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Регистрация")),
        automaticallyImplyLeading: false,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) => value!.isEmpty ? 'Введите имя пользователя' : null,
              onChanged: (value) {setState(() {
                username = value;
              });},
            ),
            TextFormField(
              validator: (value) => value!.isEmpty ? 'Введите адрес почты' : null,
              onChanged: (value) {setState(() {
                email = value;
              });},
            ),
            TextFormField(
              obscureText: true,
              validator: (value) => value!.length < 8 ? 'Пароль должен быть минимум 8 символов' : null,
              onChanged: (value) {setState(() {
                password = value;
              });},
            ),
            TextButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  dynamic response = await _auth.signUp(email, password);
                }
              },
              child: const Text("Зарегистрироваться"))
          ],
        ),
      ),
    );
  }
}

