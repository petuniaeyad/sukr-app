import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/controller/parents_controller.dart';
import 'package:sukar/presintation/widgets/text_field.dart';
import 'package:sukar/utils/app_color.dart';

class ChildProfile extends GetView<ParentsController> {
  const ChildProfile({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          Positioned(
            top: -10,
            right: 0,
            child: Image.asset("assets/image/jpg/catPaw.png", scale: 0.7),
          ),
          Positioned(
            top: 230,
            left: 0,
            right: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.sizeOf(context).width * .9,
                  height: 90,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 44, 213, 168),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "Your child's profile".tr,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter your name".tr, // هنا تم إضافة الترجمة
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          width: MediaQuery.sizeOf(context).width * 0.55,
                          child: MainTextField(
                            controller: controller.nickname,
                            hint: "Enter name".tr, // هنا تم إضافة الترجمة
                            textInputType: TextInputType.name,
                            fillColor: AppColor2.backgroundColor,
                            isBorder: true,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Child's picture".tr, // هنا تم إضافة الترجمة
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: const Color(0xFF5a5ea3),
                            borderRadius: BorderRadius.circular(1111),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.face,
                              size: 60,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 45),
                  child: ElevatedButton(
                    onPressed: () {
                      controller.picAndNickName();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 44, 213, 168),
                      padding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 40,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text(
                      "Next".tr, // هنا تم إضافة الترجمة
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: Image.asset("assets/image/jpg/cat.png"),
          ),
        ],
      ),
    );
  }
}
