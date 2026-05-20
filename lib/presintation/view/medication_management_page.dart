import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/widgets/text_field.dart';

class MedicationManagementPage extends StatefulWidget {
  const MedicationManagementPage({super.key});

  @override
  State<MedicationManagementPage> createState() =>
      _MedicationManagementPageState();
}

class _MedicationManagementPageState extends State<MedicationManagementPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController doseController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  List<Map<String, dynamic>> medications = [];
  String? editingMedicationId;

  @override
  void initState() {
    super.initState();
    fetchMedicationsFromFirebase();
  }

  Future<void> addMedicationToFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final docRef = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('medications')
        .add({
          'name': nameController.text.trim(),
          'dose': doseController.text.trim(),
          'time': timeController.text.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        });

    if (mounted) {
      setState(() {
        medications.add({
          'id': docRef.id,
          'name': nameController.text.trim(),
          'dose': doseController.text.trim(),
          'time': timeController.text.trim(),
        });
      });
    }

    nameController.clear();
    doseController.clear();
    timeController.clear();
  }

  Future<void> updateMedicationInFirebase(String id) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('medications')
        .doc(id)
        .update({
          'name': nameController.text.trim(),
          'dose': doseController.text.trim(),
          'time': timeController.text.trim(),
        });

    if (mounted) {
      setState(() {
        final index = medications.indexWhere((med) => med['id'] == id);
        if (index != -1) {
          medications[index] = {
            'id': id,
            'name': nameController.text.trim(),
            'dose': doseController.text.trim(),
            'time': timeController.text.trim(),
          };
        }
      });
    }

    nameController.clear();
    doseController.clear();
    timeController.clear();
    editingMedicationId = null;
  }

  Future<void> fetchMedicationsFromFirebase() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    final snapshot =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .collection('medications')
            .orderBy('createdAt', descending: true)
            .get();

    final meds =
        snapshot.docs.map((doc) {
          final data = doc.data();
          return {
            'id': doc.id,
            'name': data['name'] ?? '',
            'dose': data['dose'] ?? '',
            'time': data['time'] ?? '',
          };
        }).toList();

    if (mounted) {
      setState(() {
        medications = meds;
      });
    }
  }

  Future<void> deleteMedicationFromFirebase(String id) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .collection('medications')
        .doc(id)
        .delete();
  }

  void addMedication() async {
    if (nameController.text.isNotEmpty &&
        doseController.text.isNotEmpty &&
        timeController.text.isNotEmpty) {
      if (editingMedicationId == null) {
        await addMedicationToFirebase();
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text("Medication added successfully".tr)),
        );
      } else {
        await updateMedicationInFirebase(editingMedicationId!);
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(content: Text("Medication updated successfully".tr)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Get.locale?.languageCode == 'ar';

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("Manage Your Medications".tr),
        backgroundColor: const Color(0xFF5a5ea3),
      ),
      body: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Medication Name".tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              MainTextField(
                controller: nameController,
                hint: "Enter medication name".tr,
                textInputType: TextInputType.text,
                isBorder: true,
              ),
              const SizedBox(height: 16),
              Text(
                "Dose (e.g. 500mg)".tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              MainTextField(
                controller: doseController,
                hint: "Enter dose".tr,
                textInputType: TextInputType.text,
                isBorder: true,
              ),
              const SizedBox(height: 16),
              Text(
                "Time to Take".tr,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              MainTextField(
                controller: timeController,
                hint: "e.g. Morning, Evening".tr,
                textInputType: TextInputType.text,
                isBorder: true,
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: addMedication,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5a5ea3),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    editingMedicationId == null
                        ? "Add Medication".tr
                        : "Update Medication".tr,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              Text(
                "Medications List".tr,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              medications.isEmpty
                  ? Center(child: Text("No medications added yet.".tr))
                  : SizedBox(
                    height: 300,
                    child: ListView.builder(
                      itemCount: medications.length,
                      itemBuilder: (_, index) {
                        final med = medications[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(med['name']),
                            subtitle: Text(
                              "${'Dose'.tr}: ${med['dose']} | ${'Time'.tr}: ${med['time']}",
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      editingMedicationId = med['id'];
                                      nameController.text = med['name'];
                                      doseController.text = med['dose'];
                                      timeController.text = med['time'];
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                  onPressed: () async {
                                    await deleteMedicationFromFirebase(
                                      med['id'],
                                    );
                                    if (mounted) {
                                      setState(() {
                                        medications.removeAt(index);
                                      });
                                    }

                                    ScaffoldMessenger.of(
                                      Get.context!,
                                    ).showSnackBar(
                                      SnackBar(
                                        content: Text("Medication deleted".tr),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
