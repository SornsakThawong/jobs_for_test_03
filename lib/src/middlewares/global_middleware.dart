import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_test_03/src/feature/user/controllers/user_controller.dart';

import '../routers/route_path.dart';

class GlobalMiddleware extends GetMiddleware {
  final userCtrl = Get.find<UserController>();

  @override
  int? get priority => 0;

  @override
  RouteSettings? redirect(String? route) {
    log(" ==========> accessToken : ${userCtrl.accessToken}");
    if (userCtrl.accessToken == '') {
      return const RouteSettings(name: RoutePath.login);
    }
    return null;
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    log('onPageCalled ${page.toString()}');
    return page;
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    // This function will be called right before the Bindings are initialize,
    // then bindings is null
    // bindings = [OtherBinding()];
    return bindings;
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    log('Bindings of ${page.toString()} are ready');
    return page;
  }

  @override
  Widget onPageBuilt(Widget page) {
    log('Widget ${page.toStringShort()} will be showed');
    return page;
  }

  @override
  void onPageDispose() {
    log('PageDisposed');
  }
}
