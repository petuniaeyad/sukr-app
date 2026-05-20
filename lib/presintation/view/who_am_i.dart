import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/helper/theme/app_colors.dart';
import 'package:sukar/presintation/controller/auth_controller.dart';
import 'package:sukar/utils/app_color.dart';
import 'package:sukar/utils/constant.dart';

class UserType extends GetView<AuthController> {
  const UserType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor2.backgroundColor,
        shadowColor: AppColor2.backgroundColor,
        surfaceTintColor: AppColor2.backgroundColor,
        centerTitle: true,
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
      ),
      body: Stack(
        children: [
          Container(
            color: AppColor2.backgroundColor,
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
          ),
          Positioned(top: 150, left: 100, child: imageThing(2)),
          Positioned(top: 60, right: -40, child: imageThing(1)),
          Positioned(top: -10, right: 80, child: imageThing(2)),
          Positioned(top: 200, right: 40, child: imageThing(1)),
          Positioned(top: 220, left: 20, child: imageThing(1)),
          Positioned(top: 150, right: -50, child: imageThing(2)),
          Positioned(top: 250, left: 150, child: imageThing(1)),
          Positioned(top: 80, left: -30, child: imageThing(1)),
          Positioned(top: 300, right: 120, child: imageThing(2)),
          Positioned(top: 180, left: 200, child: imageThing(1)),
          Positioned(top: 20, right: 150, child: imageThing(2)),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(height: 0),
              Container(
                width: 150,
                height: 150,
                padding: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  "assets/image/jpg/6e7dbab8-c917-4cc2-8934-da278d1f7554-removebg-preview.png",
                  scale: 2.8,
                ),
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: height(context) * .5,
                    width: width(context),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 60),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Who am i?".tr,
                          style: TextStyle(
                            color: Color(0xff5a5ea3),
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                        Column(
                          children: [
                            Obx(
                              () => Center(
                                child: GestureDetector(
                                  onTap: () => controller.selectUserType(),
                                  child: Container(
                                    width: width(context) * .6,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color:
                                          controller.isSelected.value == false
                                              ? AppColor2.backgroundColor
                                              : Color(0xff5a5ea3),

                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color:
                                            controller.isSelected.value == false
                                                ? AppColors.black
                                                : AppColor2.backgroundColor,
                                        width: 3,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Parent".tr,
                                        style: TextStyle(
                                          fontSize: 18,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.w900,
                                          color:
                                              controller.isSelected.value ==
                                                      false
                                                  ? AppColors.black
                                                  : AppColor2.backgroundColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
                            Obx(
                              () => Center(
                                child: GestureDetector(
                                  onTap: () => controller.selectUserType2(),
                                  child: Container(
                                    width: width(context) * .6,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color:
                                          controller.isSelected1.value == false
                                              ? AppColor2.backgroundColor
                                              : Color(0xff5a5ea3),

                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        color:
                                            controller.isSelected1.value ==
                                                    false
                                                ? AppColors.black
                                                : AppColor2.backgroundColor,
                                        width: 3,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Caregiver".tr,
                                        style: TextStyle(
                                          fontSize: 18,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.w900,
                                          color:
                                              controller.isSelected1.value ==
                                                      false
                                                  ? AppColors.black
                                                  : AppColor2.backgroundColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: () async {
                              await controller.updateFirebaseUserType();
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 8),
                              width: width(context) * .45,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(100),
                                border: Border.all(
                                  color: Color(0xff5a5ea3),
                                  width: 3,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Next".tr,
                                  style: TextStyle(
                                    fontSize: 18,
                                    letterSpacing: 3,
                                    fontWeight: FontWeight.w900,
                                    color: Color(0xff5a5ea3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget imageThing(int rotation) {
  return RotatedBox(
    quarterTurns: rotation,
    child: SizedBox(
      width: 100,
      child: Image.asset(
        "assets/image/jpg/Screenshot_2025-04-14_213645-removebg-preview.png",
      ),
    ),
  );
}
