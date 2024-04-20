import 'package:flutter/material.dart';
import 'package:gstou4/services/auth.dart';

import 'package:provider/provider.dart';
import 'package:gstou4/models/user_model.dart';

import 'package:gstou4/activities/authentication/adapter.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel?>.value(
      initialData: null,
      value: AuthService().user,
      child: const MaterialApp(
        title: "VUZGid",
        home: Adapter(),
      ),
    );
  }
}
