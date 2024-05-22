import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/profile/car_list_tile.dart';
import 'package:vroom_campus_app/profile/profile_vm.dart';

import '../model/car.dart';
import '../model/multi_button_action.dart';
import '../widgets/multi_button.dart';

/*class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileViewState();
}*/

/*class _ProfileViewState extends State<ProfileView> {
  final List<MultiButtonAction> _actions = [
    MultiButtonAction(
        name: "W",
        action: () {
          print("test");
        }),
    MultiButtonAction(name: "M", action: () {}),
    MultiButtonAction(name: "D", action: () {}),
  ]; //in vm auslagern

  final List<Car> _cars = [
    Car(
        model: "Audi_A1",
        licensePlate: "WUN_TI",
        color: "schwarz",
        imageURL: "URL"),
    Car(model: "Passat", licensePlate: "HO_CG", color: "blau", imageURL: "URL"),
    Car(model: "Golf", licensePlate: "TOR_TI", color: "grau", imageURL: "URL")
  ];

  int _activeButtonIndex = 0;

  void _onTapHandler(int buttonIndex) {
    setState(() => _activeButtonIndex = buttonIndex);
  } //statt set provider*/

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return ChangeNotifierProvider(
      create: (context) => ProfileVM(),
      child: Consumer<ProfileVM>(
        builder: (context, vm, child) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://cdn-icons-png.flaticon.com/512/9203/9203764.png"),
                      radius: 60,
                      backgroundColor: Colors.transparent,
                    ),
                    const SizedBox(height: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("personal_data".tr()),
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: colorScheme.onSecondaryContainer,
                            borderRadius: BorderRadius.circular(26),
                          ),
                          child: Column(
                            children: [
                              Form(
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                          hintText: "Name".tr()),
                                    ),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          hintText: "Surname".tr()),
                                    ),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      decoration: InputDecoration(
                                          hintText: "E-mail".tr()),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),
                              /*MultiButton(
          actions: () {print("test");},
          activeButtonIndex: vm.currentIndex,
          onTap: ,
          activeColor: Colors.blue,
          activeTextStyle: const TextStyle(color: Colors.white),
          ),*/
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Text("Your Cars".tr()),
                        SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: colorScheme.onSecondaryContainer,
                            borderRadius: BorderRadius.circular(26),
                          ),
                          child: Column(
                            children: vm.cars
                                .map<Widget>(
                                  (car) => Row(children: [
                                    Text("${car.model} / ${car.licensePlate}")
                                  ]),
                                )
                                .toList(),
                          ),
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {},
                            child: Text("Add new car".tr()),
                          ),
                        )
                        //TODO: Button Passwort ändern
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
