import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/controller/parents_controller.dart';
import 'package:sukar/presintation/widgets/text_field.dart';
import 'package:sukar/utils/app_color.dart';
import 'package:sukar/utils/constant.dart';
import 'package:sukar/utils/tools.dart';

class ChildInfo extends GetView<ParentsController> {
  const ChildInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor2.backgroundColor,
          shadowColor: AppColor2.backgroundColor,
          surfaceTintColor: AppColor2.backgroundColor,
          centerTitle: true,
          toolbarHeight: 40,
          leadingWidth: 100,
          leading: Row(
            children: [
              SizedBox(width: 10),
              Icon(Icons.arrow_back_ios),
              InkWell(
                onTap: () => Get.back(),
                child: Text(
                  "Back".tr,
                  style: TextStyle(
                    fontSize: 19,
                    color: Colors.black87,
                    fontFamily: "PoetsenOne".tr,
                  ),
                ),
              ),
            ],
          ),
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
            SingleChildScrollView(
              physics: PageScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                  SizedBox(height: 75),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: height(context) * .6,
                        width: width(context),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                          ),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Answer these questions about your child".tr,
                              style: TextStyle(
                                color: Color(0xff5a5ea3),
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Name".tr,
                                  style: TextStyle(
                                    color: Color(0xff5a5ea3),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 140,
                                  child: MainTextField(
                                    controller: controller.nameController,
                                    hint: "Enter name".tr,
                                    textInputType: TextInputType.name,
                                    validator:
                                        (value) =>
                                            appTools.requiredFieldValidate(
                                              controller.nameController,
                                            ),
                                    fillColor: AppColor2.backgroundColor,
                                    isBorder: true,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "national_number".tr,
                                  style: TextStyle(
                                    color: Color(0xff5a5ea3),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 140,
                                  child: MainTextField(
                                    controller:
                                        controller.nationalNumberController,
                                    hint: "Enter the number".tr,
                                    textInputType: TextInputType.number,
                                    validator:
                                        (value) =>
                                            appTools.requiredFieldValidate(
                                              controller
                                                  .nationalNumberController,
                                            ),
                                    fillColor: AppColor2.backgroundColor,
                                    isBorder: true,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Gender".tr,
                                  style: TextStyle(
                                    color: Color(0xff5a5ea3),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 140,
                                  child: ListView.builder(
                                    itemBuilder: (context, index) {
                                      return Obx(
                                        () => Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                if (controller
                                                        .isSelected
                                                        .value ==
                                                    false) {
                                                  controller.isSelected.value =
                                                      true;
                                                  controller.isSelected1.value =
                                                      false;
                                                  controller
                                                      .selctedTypeUser
                                                      .value = 'Male'.tr;

                                                  log(
                                                    '${controller.selctedTypeUser}',
                                                  );
                                                }
                                              },
                                              child: Container(
                                                width: 67.5,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color:
                                                      controller
                                                                  .isSelected
                                                                  .value ==
                                                              false
                                                          ? AppColor2
                                                              .backgroundColor
                                                          : Color(0xff5a5ea3),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: const Color.fromARGB(
                                                      255,
                                                      184,
                                                      184,
                                                      184,
                                                    ),
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Male".tr,
                                                    style: TextStyle(
                                                      color:
                                                          controller
                                                                      .isSelected
                                                                      .value ==
                                                                  false
                                                              ? Colors.black
                                                              : Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5),
                                            GestureDetector(
                                              onTap: () {
                                                if (controller
                                                        .isSelected1
                                                        .value ==
                                                    false) {
                                                  controller.isSelected1.value =
                                                      true;
                                                  controller.isSelected.value =
                                                      false;

                                                  controller
                                                      .selctedTypeUser
                                                      .value = 'Female'.tr;

                                                  log(
                                                    '${controller.selctedTypeUser}',
                                                  );
                                                }
                                              },
                                              child: Container(
                                                width: 67.5,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color:
                                                      controller
                                                                  .isSelected1
                                                                  .value ==
                                                              false
                                                          ? AppColor2
                                                              .backgroundColor
                                                          : Color(0xff5a5ea3),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                    color: const Color.fromARGB(
                                                      255,
                                                      184,
                                                      184,
                                                      184,
                                                    ),
                                                    width: 1,
                                                  ),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    "Female".tr,
                                                    style: TextStyle(
                                                      color:
                                                          controller
                                                                      .isSelected1
                                                                      .value ==
                                                                  false
                                                              ? Colors.black
                                                              : Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Type of diabetes".tr,
                                  style: TextStyle(
                                    color: Color(0xff5a5ea3),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Obx(
                                  () => SizedBox(
                                    height: 60,
                                    width: 150,
                                    child: DropdownButton(
                                      value: controller.typeOfDiabetes.value,
                                      items: [
                                        DropdownMenuItem(
                                          value: "Type 1",
                                          child: Text("Type 1"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Type 2",
                                          child: Text("Type 2"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Mody",
                                          child: Text("Mody"),
                                        ),
                                        DropdownMenuItem(
                                          value: "Neonatal Diabets",
                                          child: Text("Neonatal Diabets"),
                                        ),
                                      ],
                                      onChanged: (value) {
                                        controller.typeOfDiabetes.value =
                                            value!;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Age".tr,
                                  style: TextStyle(
                                    color: Color(0xff5a5ea3),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 140,
                                  child: MainTextField(
                                    controller: controller.ageController,
                                    hint: "Enter age".tr,
                                    textInputType: TextInputType.number,
                                    validator:
                                        (value) =>
                                            appTools.requiredFieldValidate(
                                              controller.ageController,
                                            ),
                                    fillColor: AppColor2.backgroundColor,
                                    isBorder: true,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Height".tr,
                                  style: TextStyle(
                                    color: Color(0xff5a5ea3),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 140,
                                  child: MainTextField(
                                    controller: controller.heightController,
                                    hint: "Enter height".tr,
                                    textInputType: TextInputType.number,
                                    validator:
                                        (value) =>
                                            appTools.requiredFieldValidate(
                                              controller.heightController,
                                            ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Text("cm".tr),
                                    ),
                                    fillColor: AppColor2.backgroundColor,
                                    isBorder: true,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Weight".tr,
                                  style: TextStyle(
                                    color: Color(0xff5a5ea3),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                SizedBox(
                                  height: 40,
                                  width: 140,
                                  child: MainTextField(
                                    controller: controller.weightController,
                                    hint: "Enter weight".tr,
                                    textInputType: TextInputType.number,
                                    validator:
                                        (value) =>
                                            appTools.requiredFieldValidate(
                                              controller.weightController,
                                            ),
                                    prefixIcon: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                      ),
                                      child: Text("Kg".tr),
                                    ),
                                    fillColor: AppColor2.backgroundColor,
                                    isBorder: true,
                                  ),
                                ),
                              ],
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  if (controller
                                          .selctedTypeUser
                                          .value
                                          .isEmpty ||
                                      controller.nameController.text.isEmpty ||
                                      controller.ageController.text.isEmpty ||
                                      controller
                                          .heightController
                                          .text
                                          .isEmpty ||
                                      controller
                                          .weightController
                                          .text
                                          .isEmpty ||
                                      controller
                                          .nationalNumberController
                                          .text
                                          .isEmpty) {
                                    AwesomeDialog(
                                      context: Get.context!,
                                      dialogType: DialogType.warning,
                                      animType: AnimType.rightSlide,
                                      desc: "Please fill all the fields".tr,
                                      btnOkText: 'Ok',
                                      btnOkOnPress: () {},
                                      btnOkColor: Color(0xff5a5ea3),
                                    ).show();
                                  } else {
                                    controller.createChild();
                                  }
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 8),
                                  width: MediaQuery.sizeOf(context).width * .45,
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
            ),
          ],
        ),
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
