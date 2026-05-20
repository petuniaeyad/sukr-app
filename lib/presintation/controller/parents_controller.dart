import 'dart:developer';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/model/child_data_model.dart';
import 'package:sukar/model/child_profile_model.dart';
import 'package:sukar/model/login_model.dart';
import 'package:sukar/model/parents_model.dart';
import 'package:sukar/utils/app_general.dart';
import 'package:sukar/utils/routes/routes_string.dart';
import 'package:sukar/utils/tools.dart';

class ParentsController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController glucoseBeforeController = TextEditingController();
  TextEditingController glucoseAfterController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController nationalNumberController = TextEditingController();
  TextEditingController searchChild = TextEditingController();
  TextEditingController insulineDose = TextEditingController();
  TextEditingController insulineTime = TextEditingController();
  RxString dropDownLabel = "3.5".obs;
  final TextEditingController nickname = TextEditingController();
  double? glucoseDeficit;
  double? carbsNeeded;
  double? adjustedCarbsNeeded;
  double? glucoseReductionPercentage;
  double? caloriesBurned;
  double? insulinReduction;
  double activityImpactFactor = 0.8;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> exerciseKey = GlobalKey<FormState>();
  RxBool isSelected = false.obs;
  RxBool isSelected1 = false.obs;
  RxString selctedTypeUser = "".obs;
  RxString typeOfDiabetes = "Type 1".tr.obs;
  ChildProfileModel? childProfileModel;
  List<ChildProfileModel> children = [];
  @override
  void onInit() async {
    await getData();
    await getCaregiverChildren();
    update();
    super.onInit();
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

  Future<void> getCaregiverChildren() async {
    try {
      String caregiverUid = FirebaseAuth.instance.currentUser?.uid ?? '';
      if (caregiverUid.isEmpty) {
        Get.snackbar('Error', 'Caregiver not logged in');
      }

      final childrenRef = FirebaseFirestore.instance
          .collection('caregivers')
          .doc(caregiverUid)
          .collection('children');

      final querySnapshot = await childrenRef.get();

      children =
          querySnapshot.docs.map((doc) {
            return ChildProfileModel.fromJson(doc.data());
          }).toList();
     
    } catch (e) {
      log("Error getting caregiver's children: $e");
    }
  }

  // void createChild() async {
  //   try {
  //     ParentsModel parentsModel = ParentsModel(
  //       childName: nameController.text,
  //       nationalNumber: nationalNumberController.text,
  //       age: ageController.text,
  //       height: heightController.text,
  //       weight: weightController.text,
  //       typeOfDiabetes: diabetesTypeController.text,
  //       gender: selctedTypeUser.value,
  //       childLink: '',
  //       profilePic: '',
  //       nickName: '',
  //     );

  //     String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
  //     if (uid.isEmpty) {
  //       Get.snackbar('Error', 'User not logged in');
  //       return;
  //     }

  //     CollectionReference usersRef = FirebaseFirestore.instance.collection(
  //       'users',
  //     );

  //     DocumentReference docRef = await usersRef
  //         .doc(nationalNumberController.text)
  //         .collection('children')
  //         .add(parentsModel.toJson());

  //     AppGeneral.chidId = docRef.id;
  //     log('childId: ${AppGeneral.chidId}');

  //     appTools.showLoading();
  //     await Future.delayed(Duration(seconds: 2));
  //     Get.back();
  //     Get.offAllNamed(RoutesString.childProfile);
  //   } catch (e) {
  //     log("Error creating child: $e");
  //     Get.snackbar('Error', e.toString());
  //   }
  // }
  void createChild() async {
    try {
      String nationalId = nationalNumberController.text.trim();

      String uid = FirebaseAuth.instance.currentUser?.uid ?? '';
      if (uid.isEmpty) {
        return;
      }

      DocumentSnapshot nationalCheck =
          await FirebaseFirestore.instance
              .collection('national_numbers')
              .doc(nationalId)
              .get();

      if (nationalCheck.exists) {
        Get.snackbar(
          'wrong'.tr,
          'There is a child already registered with this national number'.tr,
        );
        return;
      }

      ParentsModel parentsModel = ParentsModel(
        childName: nameController.text,
        nationalNumber: nationalId,
        age: ageController.text,
        height: heightController.text,
        weight: weightController.text,
        typeOfDiabetes: typeOfDiabetes.value,
        gender: selctedTypeUser.value,
        childLink: '',
        profilePic: '',
        nickName: '',
      );

      CollectionReference childrenRef = FirebaseFirestore.instance
          .collection('users')
          .doc(uid)
          .collection('children');

      DocumentReference childDocRef = await childrenRef.add(
        parentsModel.toJson(),
      );

      await FirebaseFirestore.instance
          .collection('national_numbers')
          .doc(nationalId)
          .set({'childDocId': childDocRef.id, 'parentId': uid});

      AppGeneral.chidId = childDocRef.id;
      log('childId: ${AppGeneral.chidId}');
      appTools.showLoading();
      await Future.delayed(Duration(seconds: 2));
      Get.back();
      Get.offAllNamed(RoutesString.childProfile);
    } catch (e) {
      log("Error creating child: $e");
    }
  }

  Future<void> searchChildWithParentId(String nationalId) async {
    try {
      final nationalRef = FirebaseFirestore.instance
          .collection('national_numbers')
          .doc(nationalId);

      final nationalDoc = await nationalRef.get();

      if (!nationalDoc.exists) {
        Get.snackbar(
          'Not Found'.tr,
          'No child exists with this national number'.tr,
        );
      }

      final data = nationalDoc.data()!;
      final String parentId = data['parentId'];
      final String childDocId = data['childDocId'];

      final childRef = FirebaseFirestore.instance
          .collection('users')
          .doc(parentId)
          .collection('children')
          .doc(childDocId);

      final childDoc = await childRef.get();

      if (childDoc.exists) {
        final childData = childDoc.data()!;
        log("exists");
        childProfileModel = ChildProfileModel(
          childData: ChildData.fromJson(childData),
          childDocId: childDocId,
          parentId: parentId,
        );
        showDialog(
          context: Get.context!,
          builder: (context) {
            return Material(
              color: Colors.black.withOpacity(0.3), 
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Center(
                          child: Text(
                            "Child Information",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5A5EA3),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                        Card(
                          color: Color(0xFF5A5EA3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.child_care,
                              color: Colors.white,
                            ),
                            title: Text(
                              "Name",
                              style: TextStyle(color: Colors.white),
                            ),
                            subtitle: Text(
                              childProfileModel!.childData!.childName!,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        _buildDataRow(
                          "Gender",
                          childProfileModel!.childData!.gender!,
                        ),
                        _buildDataRow(
                          "Age",
                          childProfileModel!.childData!.age!,
                        ),
                        _buildDataRow(
                          "National Number",
                          childProfileModel!.childData!.nationalNumber!,
                        ),
                        _buildDataRow(
                          "Height",
                          childProfileModel!.childData!.height!,
                        ),
                        _buildDataRow(
                          "Nickname",
                          childProfileModel!.childData!.nickName!,
                        ),
                        _buildDataRow(
                          "Weight",
                          childProfileModel!.childData!.weight!,
                        ),
                        _buildDataRow(
                          "Diabetes Type",
                          childProfileModel!.childData!.typeOfDiabetes!,
                        ),
                        SizedBox(height: 20),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey[400],
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                'Cancel',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF5A5EA3),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 24,
                                  vertical: 12,
                                ),
                              ),
                              onPressed: () async {
                                String caregiverUid =
                                    FirebaseAuth.instance.currentUser?.uid ??
                                    '';
                                if (caregiverUid.isEmpty) {
                                  Get.snackbar(
                                    'Error',
                                    'Caregiver not logged in',
                                  );
                                  return;
                                }

                                final String nationalNumber =
                                    childProfileModel!
                                        .childData!
                                        .nationalNumber!;

                                final childRef = FirebaseFirestore.instance
                                    .collection('caregivers')
                                    .doc(caregiverUid)
                                    .collection('children')
                                    .doc(nationalNumber);

                                final existingChild = await childRef.get();

                                if (existingChild.exists) {
                                  Get.back();
                                  Get.snackbar(
                                    'Already exists'.tr,
                                    'This child has already been added to your account'
                                        .tr,
                                  );
                                  return;
                                }

                                try {
                                  await FirebaseFirestore.instance
                                      .collection('caregivers')
                                      .doc(caregiverUid)
                                      .collection('children')
                                      .doc(
                                        childProfileModel!
                                            .childData!
                                            .nationalNumber,
                                      )
                                      .set(childProfileModel!.toJson());

                                  Get.back();
                                  AwesomeDialog(
                                    context: Get.context!,
                                    dialogType: DialogType.success,
                                    animType: AnimType.rightSlide,
                                    desc:
                                        "The child has been successfully added to your account"
                                            .tr,
                                    title: "done".tr,
                                  ).show();
                                } catch (e) {
                                  log("erorr $e");
                                }
                              },
                              child: Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
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
          },
        );
      } else {
        Get.snackbar('wrong'.tr, 'National ID found, but no child data'.tr);
      }
    } catch (e) {
      log("Error searching for child: $e");
    }
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            "$label: ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Expanded(child: Text(value, style: TextStyle(color: Colors.black54))),
        ],
      ),
    );
  }

  void picAndNickName() async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('children')
        .doc(AppGeneral.chidId)
        .update({'profilePic': '', 'nickName': nickname.text});

    Get.offAllNamed(RoutesString.shareProfile);
  }

  void beforeCalculate() {
    if (weightController.text.isNotEmpty) {
      calculateActivityMetrics(
        glucoseBefore: double.parse(glucoseBeforeController.text),
        glucoseAfter: double.parse(glucoseAfterController.text),
        weightKg: double.parse(weightController.text),
        durationMinutes: double.parse(durationController.text),
        met: double.parse(dropDownLabel.value),
        activityImpactFactor: activityImpactFactor,
      );
    }
  }

  void navigation() {
    if (glucoseBeforeController.text.isNotEmpty &&
        glucoseAfterController.text.isNotEmpty &&
        durationController.text.isNotEmpty) {
      Get.toNamed(RoutesString.exercisePage2);
    } else {
      AwesomeDialog(
        context: Get.context!,
        dialogType: DialogType.warning,
        animType: AnimType.rightSlide,
        desc: "Please enter value",
        title: "Warning",
      ).show();
    }
  }

  void calculateActivityMetrics({
    required double glucoseBefore,
    required double glucoseAfter,
    required double weightKg,
    required double durationMinutes,
    required double met,
    required double activityImpactFactor,
  }) {
    double glucoseDeficit = glucoseBefore - glucoseAfter;

    double carbsNeeded = (glucoseDeficit / 40.0) * 15.0;

    double adjustedCarbsNeeded = carbsNeeded * activityImpactFactor;

    double glucoseReductionPercentage =
        (glucoseDeficit / glucoseBefore) * activityImpactFactor * 100;

    double durationHours = durationMinutes / 60.0;
    double caloriesBurned = met * weightKg * durationHours;

    double insulinReduction = (glucoseDeficit / 60) * activityImpactFactor;
    this.glucoseDeficit = glucoseDeficit;
    this.carbsNeeded = carbsNeeded;
    this.adjustedCarbsNeeded = adjustedCarbsNeeded;
    this.glucoseReductionPercentage = glucoseReductionPercentage;
    this.caloriesBurned = caloriesBurned;
    this.insulinReduction = insulinReduction;
    Get.toNamed(RoutesString.exercisePage3);
  }

  void navigationToHome() {
    glucoseBeforeController.clear();
    glucoseAfterController.clear();
    durationController.clear();
    weightController.clear();
    Get.offNamed(RoutesString.homescreen);
  }
}
