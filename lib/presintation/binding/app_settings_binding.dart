import 'package:get/get.dart';
import 'package:sukar/presintation/controller/app_setting_controller.dart';

class AppSettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AppSettingController>(() => AppSettingController());
  }
}
