import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:gstou4/models/user_model.dart';

import 'package:gstou4/activities/authentication/login_page.dart';
import 'package:gstou4/activities/home/home_activity.dart';

class Adapter extends StatelessWidget {
  const Adapter({super.key});

  @override
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel?>(context);

    if (user == null) {
      return const LoginPage();
    }
    else {
      return const HomePage();
    }
  }
}

