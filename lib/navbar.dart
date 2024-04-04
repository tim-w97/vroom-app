import 'package:flutter/material.dart';

void main() => runApp(const NavigationBarApp());

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>{
  bool _isEditable = false;
  List<TextEditingController> controllers = [];

  @override
  void initState(){
    super.initState();
    controllers.addAll([
      TextEditingController(),
      TextEditingController(),
      TextEditingController(),
    ]);
  }

  void dispose(){
    for(var controller in controllers){
      controller.dispose();
    }
    super.dispose();
  }

  Widget buildTextFromField(String labelText, TextEditingController controller, isEditable) {
    bool isFieldFilled = controller.text.isNotEmpty;
    return Padding(
      
      padding: const EdgeInsets.all(16),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: isFieldFilled  ?  InputBorder.none: const UnderlineInputBorder(),
          enabledBorder: isFieldFilled ?  InputBorder.none: const UnderlineInputBorder(),
          labelText: isFieldFilled ? null: labelText,
        ),
        readOnly: !isEditable,
        onChanged: (value){
          setState(() {

          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Profilinformationen"),
          buildTextFromField("Namen eingeben", controllers[0], _isEditable),
          buildTextFromField("Fakultät eingeben", controllers[1],_isEditable),
          buildTextFromField("Fahrzeugmodell eingeben", controllers[2],_isEditable),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  _isEditable = !_isEditable;
                });
              },
            child: Text(_isEditable ? 'Speichern' : 'Bearbeiten'),
              ),
        ],
      ),
    );
  }
}

class Fahrtenbuch extends StatelessWidget {
  const Fahrtenbuch({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Fahrtenbuch"),
        ],
      ),
    );
  }
}

class Einstellungen extends StatelessWidget {
  const Einstellungen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Einstellungen"),
        ],
      ),
    );
  }
}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigationExample(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.blue[800],
        iconTheme: IconThemeData(color: Colors.lightBlueAccent),
        textTheme: TextTheme(
          bodyMedium: TextStyle(
              fontSize: 25, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
    );
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
    const ProfilePage(),
    const Fahrtenbuch(),
    const Einstellungen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPageIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
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

}
