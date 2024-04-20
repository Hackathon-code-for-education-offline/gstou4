import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'main_class/main_app/main_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyA7UzFBzHmDgya1YYecEzwluIbH2xmsg44",
        appId: "1:645772272408:android:6301b572a104a35721f46d",
        messagingSenderId: "645772272408",
        projectId: "vuzgid-fc01b"),
  );
  runApp(const MainApp());
}
