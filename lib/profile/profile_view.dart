import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/profile/profile_vm.dart';
import '../widgets/multi_button.dart';

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
                              MultiButton(
                                actions: vm.genderSelect,
                                activeButtonIndex: vm.currentIndex,
                                onTap: vm.setIndex,
                                activeColor: Colors.blue,
                                activeTextStyle:
                                    const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text("Your Cars".tr()),
                       const SizedBox(height: 8),
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
