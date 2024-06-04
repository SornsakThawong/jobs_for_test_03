import 'package:get/get.dart';

import '../../services/prefs/prefs_service.dart';
import '../../services/prefs/prefs_service_impl.dart';

class PrefsBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PreferenceManager>(
      () => PreferenceManagerImpl(),
      tag: (PreferenceManager).toString(),
    );
  }
}
