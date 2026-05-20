import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/controller/parents_controller.dart';
import 'package:sukar/presintation/widgets/custom_bbutton.dart';
import 'package:sukar/presintation/widgets/exercise_info_widgets/exercise_info3.dart';
import 'package:sukar/presintation/widgets/text/headline4.dart';
import 'package:sukar/utils/constant.dart';
import 'package:sukar/utils/image.dart';

class ExercisePage3 extends GetView<ParentsController> {
  const ExercisePage3({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 190,
                  child: Stack(
                    children: [
                      Container(
                        width: width(context),
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Color(0xFFFFD3D3),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(100),
                            bottomRight: Radius.circular(100),
                          ),
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 25,
                                right: 17,
                                left: 9,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () => Get.back(),
                                    child: Row(
                                      children: [
                                        Icon(Icons.arrow_back_ios_new_rounded),
                                        Headline4(
                                          title: "Back".tr,
                                          style: TextStyle(
                                            fontSize: 21,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Hero(
                                    tag: 'childAvatar',
                                    child: CircleAvatar(
                                      radius: 30,
                                      backgroundColor: const Color(0xFF5a5ea3),
                                      child: Icon(
                                        Icons.person,
                                        size: 36,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 85,
                        left: 25,
                        child: Row(
                          children: [
                            Image.asset(
                              AppImage.sportWoman,
                              width: 100,
                              height: 90,
                            ),
                            SizedBox(width: 40),
                            Image.asset(
                              AppImage.exerciseLogo,
                              width: 150,
                              height: 90,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ExerciseInfo3(
                  title: "Carbohydrates needed (grams)".tr,
                  result: double.parse(
                    controller.adjustedCarbsNeeded!.toStringAsFixed(4),
                  ),
                ),
                SizedBox(height: 30),
                ExerciseInfo3(
                  title: "Glucose Reduction Percentage".tr,
                  result: double.parse(
                    controller.glucoseReductionPercentage!.toStringAsFixed(4),
                  ),
                ),
                SizedBox(height: 30),
                ExerciseInfo3(
                  title: "Insulin Reduction".tr,
                  visible: true,
                  result: double.parse(
                    controller.insulinReduction!.toStringAsFixed(4),
                  ),
                ),
                SizedBox(height: 30),
                Button(
                  height: 50,
                  width: 150,
                  color: Colors.transparent,
                  text: "Back to home".tr,
                  style: TextStyle(fontSize: 18),
                  border: Border.all(color: Colors.black, width: 1.5),
                  radius: 20,
                  onTap: () {
                    controller.navigationToHome();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
