import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_03/src/core/widgets/responsive_layout.dart';
import 'package:project_test_03/src/feature/user/controllers/user_controller.dart';
import 'package:project_test_03/src/feature/user/screens/user_screen_md.dart';
import 'package:project_test_03/src/feature/user/screens/user_screen_sm.dart';

import '../../../core/base/base_stl_widget.dart';
import '../../../language/language_key.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});
  final ctrl = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: UserScreenSM(),
      tabletBody: UserScreenMD(),
    );
  }
}

abstract class BaseUserScreen extends BaseStlScreen {
  BaseUserScreen({super.key});

  String get pokemon => LanguageKey.pokemon.tr;

  String get foodDelivery => LanguageKey.foodDelivery.tr;

  String get logout => LanguageKey.logout.tr;

  @protected
  double get padding => 20.0;

  @protected
  double get spaceHeight_1 => 11.0;

  @protected
  double get spaceHeight_2 => 22.0;

  @protected
  double get radiusAvatar => 80.0;

  @protected
  TextStyle get textStyleName =>
      const TextStyle(fontSize: 26, fontWeight: FontWeight.bold);

  @protected
  TextStyle get textStyleButton =>
      const TextStyle(fontSize: 18, fontWeight: FontWeight.bold);
}
