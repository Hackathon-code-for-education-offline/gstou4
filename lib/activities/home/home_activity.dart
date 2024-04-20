import 'package:flutter/material.dart';
import 'package:gstou4/services/auth.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () async {
            await _auth.signOut();
          },
          child: const Text("Sign Out"))
      ],
    );
  }
}
