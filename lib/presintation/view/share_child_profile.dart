import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:sukar/utils/app_color.dart';
import 'package:sukar/utils/routes/routes_string.dart';

class ShareChildProfilePage extends StatelessWidget {
  const ShareChildProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    String childLink = 'https://link-to-child-profile';
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColor2.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: AppColor2.backgroundColor,
        surfaceTintColor: AppColor2.backgroundColor,
        centerTitle: true,
        toolbarHeight: 40,
        leadingWidth: 100,
        leading: Row(
          children: [
            SizedBox(width: 10),
            Icon(Icons.arrow_back_ios, color: Colors.black87),
            Text(
              "back".tr,
              style: TextStyle(
                fontSize: 19,
                color: Colors.black87,
                fontFamily: "PoetsenOne",
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: -50,
              right: 0,
              child: Image.asset("assets/image/jpg/catPaw.png"),
            ),
            Column(
              children: [
                const SizedBox(height: 4),
                Text(
                  'Sukr'.tr, // تم إضافة الترجمة هنا
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5944B9),
                    fontFamily: 'PoetsenOne',
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFF6B6DC9),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Share access to\nyour child’s profile"
                                    .tr, // تم إضافة الترجمة هنا
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Image.asset(
                              'assets/image/jpg/add1.png',
                              height: 70,
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        Text(
                          'Your child link'.tr, // تم إضافة الترجمة هنا
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [Color(0xFF4AD2FF), Color(0xFF2E9CFF)],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 14,
                          ),
                          child: Row(
                            children: [
                              const Icon(Icons.link, color: Colors.white),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  childLink,
                                  style: const TextStyle(color: Colors.white),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Align(
                          alignment: Alignment.centerRight,
                          child: ElevatedButton(
                            onPressed: () {
                              Clipboard.setData(ClipboardData(text: childLink));
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('✅ Link copied!'),
                                  backgroundColor: Colors.black87,
                                  behavior: SnackBarBehavior.floating,
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFEAE9FF),
                              foregroundColor: const Color(0xFF5944B9),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              elevation: 0,
                            ),
                            child: Text('Copy link'.tr), // تم إضافة الترجمة هنا
                          ),
                        ),
                        const Spacer(),
                        Center(
                          child: OutlinedButton(
                            onPressed: () {
                              Get.offAllNamed(RoutesString.homescreen);
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                color: Colors.white,
                                width: 1.5,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 36,
                                vertical: 10,
                              ),
                            ),
                            child: Text(
                              'Next'.tr, // تم إضافة الترجمة هنا
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
