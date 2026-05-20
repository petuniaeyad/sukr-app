import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LanguageService {
  // تغيير اللغة
  static Future<void> changeLocale(String langCode) async {
    Get.updateLocale(Locale(langCode)); // تحديث اللغة
  }
}
