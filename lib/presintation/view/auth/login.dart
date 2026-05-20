import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/controller/auth_controller.dart';
import 'package:sukar/presintation/widgets/text_field.dart';
import 'package:sukar/utils/constant.dart';
import 'package:sukar/utils/routes/routes_string.dart';
import 'package:sukar/utils/tools.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight =
        (MediaQuery.sizeOf(context).height - AppBar().preferredSize.height);

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffe7f0f1),
        appBar: AppBar(
          backgroundColor: const Color(0xffe7f0f1),
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            "sign_in_to_continue".tr,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.black87,
              fontFamily: "PoetsenOne",
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const PageScrollPhysics(),
          child: Form(
            key: controller.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    SizedBox(
                      height: screenHeight * .95,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            height: screenHeight * 0.7,
                            width: Get.width,
                            decoration: const BoxDecoration(
                              color: Color(0xFF5a5ea3),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: screenHeight * 0.05),
                                Text(
                                  'login'.tr,
                                  style: TextStyle(
                                    fontSize: width(context) * 0.14,
                                    fontFamily: 'PoetsenOne',
                                    color: Colors.white,
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'email'.tr,
                                      style: TextStyle(
                                        fontSize: width(context) * 0.05,
                                        color: Colors.white,
                                        fontFamily: 'PoetsenOne',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 65,
                                      width: width(context) * .9,
                                      child: MainTextField(
                                        controller: controller.loginEmail,
                                        hint: "enter_email".tr,
                                        validator:
                                            (value) => appTools.emailValidate(
                                              controller.loginEmail,
                                            ),
                                        textInputType:
                                            TextInputType.emailAddress,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'password'.tr,
                                      style: TextStyle(
                                        fontSize: width(context) * 0.05,
                                        color: Colors.white,
                                        fontFamily: 'PoetsenOne',
                                      ),
                                    ),
                                    SizedBox(
                                      height: 65,
                                      width: width(context) * .9,
                                      child: Obx(
                                        () => MainTextField(
                                          controller: controller.loginPass,
                                          hint: "enter_password".tr,
                                          obscureText:
                                              !controller
                                                  .visiblePasswordLogIn
                                                  .value,
                                          validator:
                                              (value) => appTools
                                                  .requiredFieldValidate(
                                                    controller.loginPass,
                                                  ),
                                          textInputType:
                                              TextInputType.visiblePassword,
                                          suffixIcon: IconButton(
                                            onPressed: () {
                                              controller
                                                  .visiblePasswordLogIn
                                                  .value = !controller
                                                      .visiblePasswordLogIn
                                                      .value;
                                            },
                                            icon: Icon(
                                              controller
                                                      .visiblePasswordLogIn
                                                      .value
                                                  ? Icons.visibility_off_rounded
                                                  : Icons.visibility_rounded,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "dont_have_account".tr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width(context) * 0.045,
                                        fontFamily: "PoetsenOne",
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Get.toNamed(RoutesString.signUp);
                                      },
                                      child: Text(
                                        "sign_up".tr,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: width(context) * 0.045,
                                          fontFamily: "PoetsenOne",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Center(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      controller.login();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF5a5ea3),
                                      side: const BorderSide(
                                        color: Colors.white,
                                        width: 2,
                                      ),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.02,
                                        horizontal: width(context) * 0.2,
                                      ),
                                    ),
                                    child: Text(
                                      "login".tr,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width(context) * 0.05,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 80, top: 35),
                      child: Image.asset(
                        "assets/image/jpg/fa02b74c-c879-4d14-97ba-7f036c3dbc7c-removebg-preview.png",
                        scale: width(context) * 0.005,
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: -20,
                      child: Text(
                        'Sukr',
                        style: TextStyle(
                          fontSize: width(context) * 0.14,
                          fontFamily: 'PoetsenOne',
                          color: const Color(0xFF5a5ea3),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
