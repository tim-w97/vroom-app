import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vroom_campus_app/authentication/authentication_view.dart';
import 'package:vroom_campus_app/rides/ride_view.dart';
import 'placeholder_views.dart';

class NavigationVM with ChangeNotifier {
  List<NavBarItem> items = [
    NavBarItem(
        widget: const AuthenticationView(),
        label: "profile_navbar".tr(),
        icon: Icons
            .person), //TODO This lead s to the Authentication screen for now :)
    NavBarItem(
        isAppbarHidden: true,
        widget: const RideView(),
        label: "drivers_log_navbar".tr(),
        icon: Icons.book),
    NavBarItem(
        widget: const SettingsPage(),
        label: "settings_navbar".tr(),
        icon: Icons.settings),
  ];

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  bool get isAppbarHidden => items[_currentIndex].isAppbarHidden ?? false;
  Widget get currentPage => items[_currentIndex].widget;
}

class NavBarItem {
  final Widget widget;
  final String label;
  final IconData icon;
  bool ?isAppbarHidden = false;

  NavBarItem({required this.widget, required this.label, required this.icon,this.isAppbarHidden});
}
