import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/controller/app_setting_controller.dart';
import 'package:sukar/presintation/widgets/language_selector_screen.dart';
import 'package:sukar/utils/routes/routes_string.dart';

class IntroScreen extends GetView<AppSettingController> {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFe7f0f1),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFF5a5ea3)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: LanguageButton(),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Sukr',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'PoetsenOne',
                    color: Colors.white,
                  ),
                ),
                Image.asset(
                  'assets/image/jpg/ebd56988-bbe2-4801-bcdc-438d3c972726-removebg-preview.png',
                  scale: 1.5,
                ),
              ],
            ),
          ),

          const SizedBox(height: 40),
          SizedBox(
            height: 220,
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.totalPages,
                    onPageChanged: (index) {
                      controller.currentPage.value = index;
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Color(0xFF5a5ea3),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          controller.boxTexts[index],
                          style: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            height: 1.5,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                controller.buildDots(),
              ],
            ),
          ),

          const SizedBox(height: 38.7),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/image/jpg/left cloud.png'),

              ValueListenableBuilder<int>(
                valueListenable: controller.currentPage,
                builder: (context, current, child) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5a5ea3),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 12,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      if (current < controller.totalPages - 1) {
                        controller.pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        controller.saveIntro();
                        Get.offAllNamed(RoutesString.login);
                      }
                    },
                    child: Text(
                      current == controller.totalPages - 1
                          ? '   Get Started'
                          : 'Next',
                      style: const TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  );
                },
              ),

              Image.asset('assets/image/jpg/right cloud.png'),
            ],
          ),
        ],
      ),
    );
  }
}
