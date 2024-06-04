import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_03/src/feature/auth/controllers/login_controller.dart';

import 'login_screen.dart';

class LoginScreenSM extends BaseLoginScreen {
  LoginScreenSM({super.key});
  final ctrl = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: appBar,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: padding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: ctrl.txtEmail,
                decoration: inputDecoration.copyWith(label: Text(email)),
              ),
              SizedBox(
                height: spaceHeight_2,
              ),
              Obx(
                () => TextFormField(
                  controller: ctrl.txtPassword,
                  obscureText: ctrl.showPassword,
                  decoration: inputDecoration.copyWith(
                    label: Text(password),
                    suffixIcon: IconButton(
                      onPressed: () =>
                          ctrl.onSetShowPassword(ctrl.showPassword),
                      icon: Icon(
                        ctrl.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: spaceHeight_2,
              ),
              ElevatedButton(
                  onPressed: () => ctrl.onLogin(), child: Text(login))
            ],
          ),
        ),
      ),
    );
  }
}
