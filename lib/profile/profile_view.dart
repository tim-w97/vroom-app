import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../model/multi_button_action.dart';
import '../widgets/multi_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<StatefulWidget> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final List<MultiButtonAction> _actions = [
    MultiButtonAction(
        name: "W",
        action: () {
          print("test");
        }),
    MultiButtonAction(name: "M", action: () {}),
    MultiButtonAction(name: "D", action: () {}),
  ]; //in vm auslagern

  int _activeButtonIndex = 0;

  void _onTapHandler(int buttonIndex) {
    setState(() => _activeButtonIndex = buttonIndex);
  } //statt set provider

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

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
                  const SizedBox(height: 16),
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
                                decoration:
                                    InputDecoration(hintText: "Vorname"),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                decoration:
                                    InputDecoration(hintText: "Nachname"),
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                decoration: InputDecoration(hintText: "E-Mail"),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        MultiButton(
                          actions: _actions,
                          activeButtonIndex: _activeButtonIndex,
                          onTap: _onTapHandler,
                          activeColor: Colors.blue,
                          activeTextStyle: const TextStyle(color: Colors.white),
                        ),
                      ],
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
  }
}
