import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'navbar_provider.dart';

void main() => runApp(BottomNavBar());

class BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: MaterialApp(
        home: MainScreen(),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Consumer<NavigationProvider>(
        builder: (context, provider, child) => provider.currentPage,
      ),
      bottomNavigationBar: Consumer<NavigationProvider>(
        builder: (context, provider, child) {
          return BottomNavigationBar(
            currentIndex: provider.currentIndex,
            onTap: provider.setIndex,
            items: provider.items.map((item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
            )).toList(),
          );
        },
      ),
    );
  }
}
