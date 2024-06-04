import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';
import 'user_screen.dart';

class UserScreenMD extends BaseUserScreen {
  UserScreenMD({super.key});
  final ctrl = Get.find<UserController>();

  @override
  double get padding => 36.0;

  @override
  double get spaceHeight_1 => 22.0;

  @override
  double get spaceHeight_2 => 32.0;

  @override
  double get radiusAvatar => 160.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CircleAvatar(
                radius: radiusAvatar,
              ),
              SizedBox(
                height: spaceHeight_2,
              ),
              Text(
                "${ctrl.user.firstName ?? ""}  ${ctrl.user.lastName ?? ""}",
                style: textStyleName,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: spaceHeight_2,
              ),
              ElevatedButton(
                onPressed: () => ctrl.onPokemon(),
                child: Text(
                  pokemon,
                  style: textStyleButton,
                ),
              ),
              SizedBox(
                height: spaceHeight_2,
              ),
              ElevatedButton(
                onPressed: () => ctrl.onFoodDelivery(),
                child: Text(
                  foodDelivery,
                  style: textStyleButton,
                ),
              ),
              SizedBox(
                height: spaceHeight_2,
              ),
              ElevatedButton(
                onPressed: () => ctrl.onLogout(),
                child: Text(
                  logout,
                  style: textStyleButton,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
