import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_03/src/core/providers/product_provider.dart';

import 'flavor/build_config.dart';
import 'flavor/env_config.dart';
import 'flavor/environment.dart';
import 'src/app.dart';
import 'src/core/config/app_config.dart';
import 'src/feature/user/controllers/user_controller.dart';
import 'src/language/language_controller.dart';

void main() async {
  EnvConfig devConfig = EnvConfig(
    appName: "STG",
    baseUrl: AppConfig.baseUrl,
  );

  BuildConfig.instantiate(
    envType: Environment.STAGING,
    envConfig: devConfig,
  );

  await Get.putAsync(() => LanguageController().init());
  await Get.putAsync(() => UserController().init());
  await Get.putAsync(() => ProductProvider().init());
  runApp(App());
}
