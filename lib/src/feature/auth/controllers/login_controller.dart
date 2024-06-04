import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_03/src/core/base/base_controller.dart';
import 'package:project_test_03/src/core/config/user_data_config.dart';
import 'package:project_test_03/src/core/widgets/dialog/basic_alert_widget.dart';
import 'package:project_test_03/src/feature/user/controllers/user_controller.dart';
import 'package:project_test_03/src/routers/route_path.dart';

import '../../user/models/user_model.dart';

class LoginController extends BaseController {
  final _userCtrl = Get.find<UserController>();

  // final PreferenceManager _preference =
  //     Get.find(tag: (PreferenceManager).toString());

  final txtEmail = TextEditingController(text: UserDummy.email);
  final txtPassword = TextEditingController(text: UserDummy.pass);

  final _showPassword = true.obs;
  bool get showPassword => _showPassword.value;

  set setShowPassword(bool value) {
    _showPassword.value = value;
  }

  onSetShowPassword(bool value) {
    setShowPassword = !value;
  }

  onLogin() {
    if (txtEmail.text != UserDummy.email) {
      BasicAlertWidget.alertWarning(
          title: "เกิดข้อผิดพลาด", contents: "อีเมลไม่ถูกต้อง!");
      return;
    }
    if (txtPassword.text != UserDummy.pass) {
      BasicAlertWidget.alertWarning(
          title: "เกิดข้อผิดพลาด", contents: "รหัสผ่านไม่ถูกต้อง!");
      return;
    }
    UserModel user = UserModel(
      email: txtEmail.text,
      password: UserDummy.pass,
      firstName: UserDummy.firstName,
      lastName: UserDummy.lastName,
    );
    _userCtrl.updateUser(user).then((value) {
      if (value) {
        Get.offNamed(RoutePath.user);
      } else {
        BasicAlertWidget.alertWarning(
            title: "เกิดข้อผิดพลาด", contents: "อัพเดทข้อมูลไม่สำเร็จ!");
      }
    });
  }
}
