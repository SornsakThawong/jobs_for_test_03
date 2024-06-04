import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';
import 'login_screen.dart';

class LoginScreenMD extends BaseLoginScreen {
  LoginScreenMD({super.key});
  final ctrl = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
