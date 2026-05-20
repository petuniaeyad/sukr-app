import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/controller/auth_controller.dart';
import 'package:sukar/presintation/widgets/text_field.dart';
import 'package:sukar/utils/app_color.dart';
import 'package:sukar/utils/constant.dart';
import 'package:sukar/utils/tools.dart';

class Signup extends GetView<AuthController> {
  const Signup({super.key});

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
          title: Text(
            "Sukr",
            style: TextStyle(
              fontSize: 40,
              letterSpacing: 1.8,
              fontFamily: 'PoetsenOne',
              color: const Color(0xFF5a5ea3),
            ),
            textAlign: TextAlign.center,
          ),
          automaticallyImplyLeading: false,
          leadingWidth: 101,
          leading: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () => Get.back(),
              ),
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
        backgroundColor: AppColor2.backgroundColor,
        body: SingleChildScrollView(
          physics: PageScrollPhysics(),
          child: Form(
            key: controller.registarFormKey,
            child: Column(
              children: [
                Container(
                  color: AppColor2.backgroundColor,
                  width: width(context),
                  height: height(context),
                  child: Stack(
                    children: [
                      Positioned(
                        left: -width(context) * .2,
                        top: height(context) * .06,
                        child: Center(child: bubble(Color(0xff5a5ea3))),
                      ),
                      Positioned(
                        right: -width(context) * .25,
                        bottom: -height(context) * .15,
                        child: Center(child: bubble(Color(0xff68b4bb))),
                      ),
                      Center(
                        child: Column(
                          children: [
                            SizedBox(height: 5),
                            Text(
                              "Signup".tr,
                              style: TextStyle(
                                fontSize: 30,
                                letterSpacing: 4,
                                color: Colors.black87,
                                fontFamily: "PoetsenOne",
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: width(context) * .77,
                              height: height(context) * .80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 32,
                                  horizontal: 24,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'FirstName'.tr,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff5a5ea3),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                      child: MainTextField(
                                        color: AppColor2.backgroundColor,
                                        controller: controller.fname,
                                        hint: 'EnterYourName'.tr,
                                        validator:
                                            (value) =>
                                                appTools.requiredFieldValidate(
                                                  controller.fname,
                                                ),
                                        fillColor: AppColor2.backgroundColor,
                                        textInputType: TextInputType.name,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'LastName'.tr,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff5a5ea3),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 60,
                                      child: MainTextField(
                                        color: AppColor2.backgroundColor,
                                        controller: controller.lname,
                                        hint: 'EnterYourName'.tr,
                                        validator:
                                            (value) =>
                                                appTools.requiredFieldValidate(
                                                  controller.lname,
                                                ),
                                        fillColor: AppColor2.backgroundColor,
                                        textInputType: TextInputType.name,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Email'.tr,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff5a5ea3),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: MainTextField(
                                        color: AppColor2.backgroundColor,
                                        controller: controller.registarEmail,
                                        hint: 'EnterEmail'.tr,
                                        validator:
                                            (value) => appTools.emailValidate(
                                              controller.registarEmail,
                                            ),
                                        fillColor: AppColor2.backgroundColor,
                                        textInputType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'Password'.tr,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff5a5ea3),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: Obx(
                                        () => MainTextField(
                                          color: AppColor2.backgroundColor,
                                          controller: controller.registarPass,
                                          hint: 'EnterPassword'.tr,
                                          obscureText:
                                              !controller
                                                  .visiblePasswordSignUp
                                                  .value,
                                          validator:
                                              (value) =>
                                                  appTools.passwordSetValidate(
                                                    controller.registarPass,
                                                  ),
                                          fillColor: AppColor2.backgroundColor,
                                          textInputType: TextInputType.name,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              controller
                                                  .visiblePasswordSignUp
                                                  .value = !controller
                                                      .visiblePasswordSignUp
                                                      .value;
                                            },
                                            icon: Icon(
                                              controller
                                                      .visiblePasswordSignUp
                                                      .value
                                                  ? Icons.visibility_off_rounded
                                                  : Icons.visibility_rounded,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text(
                                      'ConfirmPassword'.tr,
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xff5a5ea3),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      child: MainTextField(
                                        color: AppColor2.backgroundColor,
                                        controller: controller.confirmpass,
                                        hint: 'ReenterPassword'.tr,
                                        obscureText: true,
                                        validator:
                                            (value) => appTools
                                                .confirmPasswordValidate(
                                                  controller.confirmpass,
                                                  controller.registarPass,
                                                ),
                                        fillColor: AppColor2.backgroundColor,
                                        textInputType: TextInputType.name,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    InkWell(
                                      onTap: () {
                                        controller.register();
                                      },
                                      child: Center(
                                        child: Container(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                              .4,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            color: Colors.transparent,
                                            borderRadius: BorderRadius.circular(
                                              100,
                                            ),
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
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget bubble(Color color) {
  return Container(
    width: 250,
    height: 250,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(1000),
    ),
  );
}
