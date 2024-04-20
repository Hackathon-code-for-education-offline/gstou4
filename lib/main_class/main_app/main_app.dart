import 'package:flutter/material.dart';

import 'package:gstou4/activities/authentication/adapter.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "VUZGid",
      home: Adapter(),
    );
  }
}
