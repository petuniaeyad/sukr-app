import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/view/Localization/language_service.dart';
import 'package:sukar/utils/routes/routes_string.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  // دالة لحفظ اللغة في SharedPreferences
  Future<void> saveLanguage(String languageCode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('language', languageCode); // حفظ اللغة
    await LanguageService.changeLocale(languageCode); // تغيير اللغة
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr),
        backgroundColor: const Color(0xFF5a5ea3),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [
          SettingItem(
            icon: Icons.person,
            title: 'profile'.tr,
            subtitle: 'manage_profile'.tr,
            onTap: () => Get.toNamed(RoutesString.profile),
          ),
          SettingItem(
            icon: Icons.medication,
            title: 'medications'.tr,
            subtitle: 'manage_medications'.tr,
            onTap: () => Get.toNamed(RoutesString.medicationmanagementpage),
          ),
          SettingItem(
            icon: Icons.restaurant,
            title: 'meals'.tr,
            subtitle: 'manage_meals'.tr,
            onTap: () => Get.toNamed(RoutesString.mealmanagementpage),
          ),
          SettingItem(
            icon: Icons.palette,
            title: 'theme'.tr,
            subtitle: 'switch_theme'.tr,
            onTap: () {},
          ),
          SettingItem(
            icon: Icons.lock,
            title: 'privacy'.tr,
            subtitle: 'manage_privacy'.tr,
            onTap: () {
              Get.toNamed(RoutesString.privacypolicypage);
            },
          ),
          SettingItem(
            icon: Icons.language,
            title: 'language'.tr,
            subtitle: 'select_language'.tr,
            onTap: () {
              Get.defaultDialog(
                title: 'translation_settings'.tr,
                content: Column(
                  children: [
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: Text('english'.tr),
                      onTap: () async {
                        await saveLanguage('en'); // حفظ اللغة الإنجليزية
                        Get.back();
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.language),
                      title: Text('arabic'.tr),
                      onTap: () async {
                        await saveLanguage('ar'); // حفظ اللغة العربية
                        Get.back();
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const SettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: const Color(0xFF5a5ea3)),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.arrow_forward_ios),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
