import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/controller/parents_controller.dart';
import 'package:sukar/presintation/widgets/text_field.dart';

class AddDoseOfInsulin extends StatelessWidget {
  const AddDoseOfInsulin({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ParentsController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Manage Your insuline".tr),
            backgroundColor: const Color(0xFF5a5ea3),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Medication Name".tr,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  MainTextField(
                    controller: TextEditingController(),
                    hint: "Insuline".tr,
                    textInputType: TextInputType.text,
                    isBorder: true,

                    enabled: false,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Dose (e.g. 500mg)".tr,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  MainTextField(
                    controller: controller.insulineDose,
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
                    controller: controller.insulineTime,
                    hint: "e.g. Morning, Evening".tr,
                    textInputType: TextInputType.text,
                    isBorder: true,
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF5a5ea3),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text("Add Dose".tr),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
