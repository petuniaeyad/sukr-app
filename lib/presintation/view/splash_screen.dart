import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:sukar/presintation/controller/app_setting_controller.dart';

class SplashScreen extends GetView<AppSettingController> {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    controller.checkNetwork();
   
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              color: const Color(0xFF5a5ea3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [
                      SizedBox(height: 40),
                      const Text(
                        'Hi there!',
                        style: TextStyle(
                          fontSize: 28.5,
                          color: Color(0xFFe7f0f1),

                          fontFamily: "PoetsenOne",
                        ),
                      ),

                      Image.asset(
                        'assets/image/jpg/Splash-removebg-preview.png',
                        height: 350,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              color: const Color(0xFFE9F2F9),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'sukr app',
                    style: TextStyle(
                      fontSize: 45.2,
                      color: Colors.black87,
                      fontFamily: "PoetsenOne",
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Sweet care for diabetes \n kids',
                    style: TextStyle(
                      fontSize: 19,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontFamily: "PoetsenOne",
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
