import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/firebase_options.dart';
import 'package:sukar/utils/routes/routes.dart';
import 'presintation/view/Localization/app_translations.dart';

String fireBaseToken = '';
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('رسالة في الخلفية: ${message.messageId}');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  await firebaseMessaging.getToken().then((token) {
    fireBaseToken = token!;
    log('Device Token: $token');
  });
  runApp(const Sukr());
}

class Sukr extends StatelessWidget {
  const Sukr({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: Get.deviceLocale ?? const Locale('en'),
      fallbackLocale: const Locale('en'),
      debugShowCheckedModeBanner: false,
      getPages: pages,
    );
  }
}
