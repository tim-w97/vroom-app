import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vroom_campus_app/profile/profile_vm.dart';
import 'package:vroom_campus_app/widgets/edit_data_button.dart';
import '../widgets/multi_button.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileView();
}

class _ProfileView extends State<ProfileView> {
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("personal_data".tr()),
                            EditDataButton(
                              onTap: vm.editButtonHandler,
                              isEditing: vm.isEditing,
                            )
                          ],
                        ),
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
                                      enabled: vm.isEditing,
                                      decoration: InputDecoration(
                                          hintText: "Name".tr()),
                                    ),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      enabled: vm.isEditing,
                                      decoration: InputDecoration(
                                          hintText: "Surname".tr()),
                                    ),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      enabled: vm.isEditing,
                                      decoration: InputDecoration(
                                          hintText: "E-mail".tr()),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 32),
                              MultiButton(
                                enabled: vm.isEditing,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Your Cars".tr()),
                            EditDataButton(
                              isEditing: vm.isEditingCars,
                              onTap: vm.editCarsButtonHandler,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        vm.cars.isNotEmpty
                            ? Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: colorScheme.onSecondaryContainer,
                                  borderRadius: BorderRadius.circular(26),
                                ),
                                child: Column(
                                  children: vm.cars
                                      .map<Widget>(
                                        (car) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                                "${car.model} / ${car.licensePlate}"),
                                            if (vm.isEditingCars)
                                              GestureDetector(
                                                onTap: () => vm.removeCar(car),
                                                child: const Icon(
                                                    Icons.delete_outline),
                                              ),
                                          ],
                                        ),
                                      )
                                      .toList(),
                                ),
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "No cars available",
                                    textAlign: TextAlign.center,
                                  ),
                                ],
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
