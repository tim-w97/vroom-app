import 'package:flutter/material.dart';
import 'package:vroom_campus_app/style/dark_theme.dart';
import 'package:vroom_campus_app/style/light_theme.dart';
import 'package:vroom_campus_app/userdefaults/shared_preferences_helper.dart';

import 'navbar/navbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: getLightTheme(),
      home: const BottomNavBar()
    );
  }
}


