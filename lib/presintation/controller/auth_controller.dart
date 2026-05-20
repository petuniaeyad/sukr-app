import 'dart:developer';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sukar/helper/theme/app_colors.dart';
import 'package:sukar/model/login_model.dart';
import 'package:sukar/model/signup_model.dart';
import 'package:sukar/presintation/widgets/padding/padding.dart';
import 'package:sukar/presintation/widgets/text/body_text1.dart';
import 'package:sukar/utils/android_loading.dart';
import 'package:sukar/utils/app_general.dart';
import 'package:sukar/utils/routes/routes_string.dart';

class AuthController extends GetxController {
  final TextEditingController loginEmail = TextEditingController();
  final TextEditingController loginPass = TextEditingController();
  final TextEditingController registarEmail = TextEditingController();
  final TextEditingController fname = TextEditingController();
  final TextEditingController lname = TextEditingController();
  final TextEditingController registarPass = TextEditingController();
  final TextEditingController confirmpass = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> registarFormKey = GlobalKey<FormState>();
  RxBool visiblePasswordLogIn = false.obs;
  RxBool visiblePasswordSignUp = false.obs;
  RxBool isSelected = false.obs;
  RxBool isSelected1 = false.obs;
  RxString selctedTypeUser = ''.obs;

  void register() async {
    if (!registarFormKey.currentState!.validate()) {
      return;
    }
    try {
      final credintial = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: registarEmail.text,
            password: confirmpass.text,
          );
      if (credintial.user!.uid.isNotEmpty) {
        SignupModel signupModel = SignupModel(
          email: registarEmail.text,
          firstName: fname.text,
          lastName: lname.text,
        );
        CollectionReference collectionReference = FirebaseFirestore.instance
            .collection('users');
        collectionReference.doc(credintial.user!.uid).set(signupModel.toJson());
        loading();
        Future.delayed(const Duration(seconds: 3), () {
          FirebaseAuth.instance.currentUser!.sendEmailVerification();
          Get.offAllNamed(RoutesString.login);
        });
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.transparent,
            // behavior: SnackBarBehavior.floating,
            elevation: 0,
            content: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.defaultBlack,
              ),
              child: const CustomePadding(
                left: 10,
                child: Row(
                  children: [
                    Icon(Icons.error, color: AppColors.white, size: 30),
                    SizedBox(width: 20),
                    BodyText1(
                      title: 'email-already-in-use',
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void selectUserType() {
    if (isSelected.value) {
      isSelected.value = false;
      isSelected1.value = false;
    } else {
      isSelected.value = true;
      isSelected1.value = false;
    }
  }

  void selectUserType2() {
    if (isSelected1.value) {
      isSelected1.value = false;
      isSelected.value = false;
    } else {
      isSelected1.value = true;
      isSelected.value = false;
    }
  }

  void login() async {
    if (!loginFormKey.currentState!.validate()) {
      return;
    }
    try {
      final credintial = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: loginEmail.text,
        password: loginPass.text,
      );

      if (FirebaseAuth.instance.currentUser!.emailVerified) {
        await getData();
        loading();
        if (AppGeneral.loginModel?.userType != null) {
          Future.delayed(const Duration(seconds: 3), () {
            Get.back();
            Get.offAllNamed(RoutesString.homescreen);
          });
        } else {
          Future.delayed(const Duration(seconds: 3), () {
            Get.back();
            Get.offAllNamed(RoutesString.userType);
          });
        }
        log(credintial.user!.uid.toString());
      } else {
        FirebaseAuth.instance.currentUser!.sendEmailVerification();
        AwesomeDialog(
          context: Get.context!,
          dialogType: DialogType.error,
          animType: AnimType.rightSlide,
          desc: "Please verifiy your email",
          title: "Email Verified!",
        ).show();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code != e.credential.toString()) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
            duration: const Duration(seconds: 3),
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.defaultBlack,
              ),
              child: const CustomePadding(
                left: 10,
                child: Row(
                  children: [
                    Icon(Icons.error, color: AppColors.white, size: 30),
                    SizedBox(width: 20),
                    BodyText1(
                      title: 'wrong Password or invalid email',
                      color: AppColors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future getData() async {
    try {
      CollectionReference collectionReference = FirebaseFirestore.instance
          .collection('users');

      AppGeneral.snapshot =
          await collectionReference
              .doc(FirebaseAuth.instance.currentUser?.uid)
              .get();
      AppGeneral.loginModel = LoginModel(
        email: AppGeneral.snapshot!['email'].toString(),
        firstName: AppGeneral.snapshot!['firstName'].toString(),
        lastName: AppGeneral.snapshot!['lastName'].toString(),
        userType: AppGeneral.snapshot!['userType'],
      );
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  void loading() {
    showDialog(
      barrierDismissible: false,
      context: Get.context!,
      builder: (context) {
        return Material(
          color: Colors.white.withAlpha(0),
          child: Container(
            margin: EdgeInsets.symmetric(
              vertical: MediaQuery.sizeOf(context).width * 0.8,
              horizontal: 60,
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(child: AndroidLoading()),
          ),
        );
      },
    );
  }

  Future<void> updateFirebaseUserType() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (isSelected.value == true) {
      selctedTypeUser.value = 'Parents'.tr;
      CollectionReference collectionReference = FirebaseFirestore.instance
          .collection('users');
      await collectionReference
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"userType": selctedTypeUser.value});
      pref.setString(selctedTypeUser.value, selctedTypeUser.value);
      Get.toNamed(RoutesString.childInfo);
    } else if (isSelected1.value == true) {
      selctedTypeUser.value = 'Caregiver'.tr;
      CollectionReference collectionReference = FirebaseFirestore.instance
          .collection('users');
      await collectionReference
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"userType": selctedTypeUser.value});
      pref.setString(selctedTypeUser.value, selctedTypeUser.value);
      Get.offAllNamed(RoutesString.homescreen);
    } else {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        desc: "Please choose one of them".tr,
        btnOkText: 'Ok'.tr,
        btnOkOnPress: () {},
        btnOkColor: Color(0xff5a5ea3),
      ).show();
    }
  }
}
