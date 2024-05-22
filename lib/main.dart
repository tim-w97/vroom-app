import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vroom_campus_app/style/dark_theme.dart';
import 'package:vroom_campus_app/style/light_theme.dart';
import 'package:vroom_campus_app/userdefaults/shared_preferences_helper.dart';

import 'navbar/navbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('de')],
      path: 'lib/assets/intl',
      fallbackLocale: const Locale('en'),
      useOnlyLangCode: true,
      child: const MyApp(),
    ),
  );
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
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const BottomNavBar(),
    );
  }
}
