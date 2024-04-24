import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navbar_vm.dart';
import '/style/dark_theme.dart';

void main() => runApp(const TestWidget());

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Beginn Einbinden des Styles
      darkTheme: getDarkTheme(),
      themeMode: ThemeMode.dark,
      // Ende Einbinden des Styles
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationVM(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: Consumer<NavigationVM>(
          builder: (context, provider, child) => provider.currentPage,
        ),
        bottomNavigationBar: Consumer<NavigationVM>(
          builder: (context, provider, child) {
            return BottomNavigationBar(
              currentIndex: provider.currentIndex,
              onTap: provider.setIndex,
              items: provider.items
                  .map((item) => BottomNavigationBarItem(
                        icon: Icon(item.icon),
                        label: item.label,
                      ))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
