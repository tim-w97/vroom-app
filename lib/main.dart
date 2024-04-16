import 'package:flutter/material.dart';
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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      home: BottomNavBar()
    );
  }
}


