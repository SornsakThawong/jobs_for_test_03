import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/user_controller.dart';
import 'user_screen.dart';

class UserScreenSM extends BaseUserScreen {
  UserScreenSM({super.key});
  final ctrl = Get.find<UserController>();

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
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
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
