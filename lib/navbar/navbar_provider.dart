import 'package:flutter/material.dart';
import 'pages_view.dart';

class NavigationProvider with ChangeNotifier {
  List<NavBarItem> items = [
    NavBarItem(widget: ProfilePage(), label: "Profil", icon: Icons.person),
    NavBarItem(widget: LogBookPage(), label: "Fahrtenbuch", icon: Icons.book),
    NavBarItem(widget: SettingsPage(), label: "Einstellungen", icon: Icons.settings),
  ];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Widget get currentPage => items[_currentIndex].widget;
}

class NavBarItem {
  final Widget widget;
  final String label;
  final IconData icon;

  NavBarItem({required this.widget, required this.label, required this.icon});
}
