import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/widgets/text_field.dart';
import 'package:sukar/utils/tools.dart';

class MealManagementPage extends StatefulWidget {
  const MealManagementPage({super.key});

  @override
  State<MealManagementPage> createState() => _MealManagementPageState();
}

class _MealManagementPageState extends State<MealManagementPage> {
  final TextEditingController mealNameController = TextEditingController();
  final TextEditingController mealTimeController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  final List<Map<String, String>> meals = [];
  final userId = FirebaseAuth.instance.currentUser!.uid;

  void addMeal() async {
    if (mealNameController.text.isNotEmpty &&
        mealTimeController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      try {
        final meal = {
          'name': mealNameController.text,
          'time': mealTimeController.text,
          'description': descriptionController.text,
        };

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('meals')
            .add(meal);

        setState(() {
          meals.add(meal);
        });

        mealNameController.clear();
        mealTimeController.clear();
        descriptionController.clear();

        ScaffoldMessenger.of(
          Get.context!,
        ).showSnackBar(SnackBar(content: Text("Meal added successfully".tr)));
      } catch (e) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text("Error adding meal: \${e.toString()}".tr)),
        );
      }
    }
  }

  Future<void> pickMealTime() async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      mealTimeController.text = picked.format(Get.context!);
    }
  }

  Future<void> editMeal(String docId) async {
    if (mealNameController.text.isNotEmpty &&
        mealTimeController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty) {
      final updatedMeal = {
        'name': mealNameController.text,
        'time': mealTimeController.text,
        'description': descriptionController.text,
      };

      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .collection('meals')
            .doc(docId)
            .update(updatedMeal);

        mealNameController.clear();
        mealTimeController.clear();
        descriptionController.clear();

        ScaffoldMessenger.of(
          Get.context!,
        ).showSnackBar(SnackBar(content: Text("Meal updated successfully".tr)));
      } catch (e) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text("Error updating meal: \${e.toString()}".tr)),
        );
      }
    }
  }

  Future<void> deleteMeal(String docId) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .collection('meals')
          .doc(docId)
          .delete();

      ScaffoldMessenger.of(
        Get.context!,
      ).showSnackBar(SnackBar(content: Text("Meal deleted successfully".tr)));
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text("Error deleting meal: \${e.toString()}".tr)),
      );
    }
  }

  @override
  void dispose() {
    mealNameController.dispose();
    mealTimeController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Manage Your Meals".tr),
        backgroundColor: const Color(0xFF5a5ea3),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Meal Name".tr, style: TextStyle(fontWeight: FontWeight.bold)),
            MainTextField(
              controller: mealNameController,
              hint: "Enter meal name".tr,
              textInputType: TextInputType.text,
              isBorder: true,
            ),
            SizedBox(height: 16),
            Text("Meal Time".tr, style: TextStyle(fontWeight: FontWeight.bold)),
            GestureDetector(
              onTap: pickMealTime,
              child: AbsorbPointer(
                child: MainTextField(
                  controller: mealTimeController,
                  hint: "Tap to pick time".tr,
                  textInputType: TextInputType.text,
                  isBorder: true,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              "Description".tr,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            MainTextField(
              controller: descriptionController,
              hint: "Short description".tr,
              textInputType: TextInputType.text,
              isBorder: true,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  appTools.showAlertDialogTwoFun(
                    Get.context!,
                    content: "Do you need To Add A Notification Remember",
                    title: "Notification Remmebr",
                    yes: () {
                      mealNameController.clear();
                      mealTimeController.clear();
                      descriptionController.clear();
                      Get.back();
                      Get.snackbar('added', 'You Added Meal With Remmber');
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5a5ea3),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text("Add Meal".tr),
              ),
            ),
            SizedBox(height: 30),
            Divider(),
            Text(
              "Meals List".tr,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance
                      .collection('users')
                      .doc(userId)
                      .collection('meals')
                      .snapshots(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(child: Text("Error loading meals".tr));
                }

                if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text("No meals available".tr));
                }

                final mealDocs = snapshot.data!.docs;
                return Column(
                  children:
                      mealDocs.map((mealDoc) {
                        final meal = {
                          'name': mealDoc['name'],
                          'time': mealDoc['time'],
                          'description': mealDoc['description'],
                        };
                        return Card(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(meal['name']),
                            subtitle: Text(
                              "Time: \${meal['time']}\n\${meal['description']}",
                            ),
                            isThreeLine: true,
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, color: Colors.blue),
                                  onPressed: () {
                                    mealNameController.text = meal['name']!;
                                    mealTimeController.text = meal['time']!;
                                    descriptionController.text =
                                        meal['description']!;

                                    showDialog(
                                      context: context,
                                      builder:
                                          (ctx) => AlertDialog(
                                            title: Text("Edit Meal".tr),
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                TextField(
                                                  controller:
                                                      mealNameController,
                                                  decoration: InputDecoration(
                                                    labelText: "Meal Name".tr,
                                                  ),
                                                ),
                                                TextField(
                                                  controller:
                                                      mealTimeController,
                                                  decoration: InputDecoration(
                                                    labelText: "Meal Time".tr,
                                                  ),
                                                ),
                                                TextField(
                                                  controller:
                                                      descriptionController,
                                                  decoration: InputDecoration(
                                                    labelText: "Description".tr,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  editMeal(mealDoc.id);
                                                  Navigator.pop(ctx);
                                                },
                                                child: Text("Save".tr),
                                              ),
                                              TextButton(
                                                onPressed:
                                                    () => Navigator.pop(ctx),
                                                child: Text("Cancel".tr),
                                              ),
                                            ],
                                          ),
                                    );
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, color: Colors.red),
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder:
                                          (ctx) => AlertDialog(
                                            title: Text("Delete Meal".tr),
                                            content: Text(
                                              "Are you sure you want to delete this meal?"
                                                  .tr,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed:
                                                    () => Navigator.pop(ctx),
                                                child: Text("Cancel".tr),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  deleteMeal(mealDoc.id);
                                                  Navigator.pop(ctx);
                                                },
                                                child: Text(
                                                  "Delete".tr,
                                                  style: TextStyle(
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
