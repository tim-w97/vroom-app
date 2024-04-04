import 'package:flutter/material.dart';

void main() => runApp(const NavigationBarApp());

class ProfilePage extends StatelessWidget{    //Jede Seite = eigene Klasse
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context){
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text ("Profilinformationen"),
        ],
      ),
    );
  }
}
class Fahrtenbuch extends StatelessWidget{
  const Fahrtenbuch({super.key});

  @override
  Widget build(BuildContext context){
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text ("Fahrtenbuch"),
        ],
      ),
    );
  }
}
class Einstellungen extends StatelessWidget{
  const Einstellungen({super.key});

  @override
  Widget build(BuildContext context){
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text ("Einstellungen"),
        ],
      ),
    );
  }
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: NavigationExample());
  }
}

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample> {
  int currentPageIndex = 0;

  final List<Widget> pages = [
    const ProfilePage (),
    const Fahrtenbuch (),
    const Einstellungen (),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });

        },
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.home),
            label: 'Profil',
          ),
          NavigationDestination(
            icon: Icon(Icons.menu_book),
            label: 'Fahrtenbuch',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings),
            icon: Icon(Icons.settings),
            label: 'Einstellungen',
          ),
        ],
      ),
    );
  }
  onProfilSelected(){                 //Logik "onProfilSelected()"
    print("Profil ausgewählt");
  }
}