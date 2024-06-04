import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_03/src/core/base/base_stl_widget.dart';
import 'package:project_test_03/src/core/widgets/responsive_layout.dart';
import 'package:project_test_03/src/feature/auth/controllers/login_controller.dart';
import 'package:project_test_03/src/feature/auth/screens/login_screen_md.dart';
import 'package:project_test_03/src/feature/auth/screens/login_screen_sm.dart';
import 'package:project_test_03/src/language/language_key.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final ctrl = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: LoginScreenSM(),
      tabletBody: LoginScreenMD(),
    );
  }
}

abstract class BaseLoginScreen extends BaseStlScreen {
  BaseLoginScreen({super.key});

  String get login => LanguageKey.login.tr;

  String get email => LanguageKey.email.tr;

  String get password => LanguageKey.password.tr;

  @protected
  double get padding => 20.0;

  @protected
  double get spaceHeight_1 => 11.0;

  @protected
  double get spaceHeight_2 => 22.0;

  InputDecoration get inputDecoration => const InputDecoration(
        enabledBorder: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(),
        disabledBorder: OutlineInputBorder(),
        errorBorder: OutlineInputBorder(),
      );
}
