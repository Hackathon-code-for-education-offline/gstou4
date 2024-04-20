import 'package:flutter/material.dart';

import 'package:gstou4/services/auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: Column(
        children: [
          TextButton(
            onPressed: () async {
              dynamic response = await _auth.signInAnon();
              print(response.toString());
            },
            child: const Text("Sign In Anon"))
        ],
      ),
    );
  }
}

