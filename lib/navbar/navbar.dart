import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navbar_provider.dart';

void main() => runApp(const TestWidget());

class TestWidget extends StatelessWidget {
  const TestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: const MaterialApp(
        home: BottomNavBar(),
      ),
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Consumer<NavigationProvider>(
        builder: (context, provider, child) => provider.currentPage,
      ),
      bottomNavigationBar: Consumer<NavigationProvider>(
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
    );
  }
}
