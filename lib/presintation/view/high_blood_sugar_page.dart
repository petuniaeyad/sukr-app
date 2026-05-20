import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class HighBloodSugarPage extends StatelessWidget {
  const HighBloodSugarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade100, Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "🔥 What is High Blood Sugar?".tr,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "High blood sugar (hyperglycemia) occurs when blood sugar levels are too high (above 180 mg/dL after meals)."
                            " It may result from missed insulin doses, consuming too much food, stress, or illness."
                        .tr,
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "⚠️ Symptoms:".tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildSymptomList([
                    "Frequent urination".tr,
                    "Increased thirst".tr,
                    "Blurred vision".tr,
                    "Fatigue".tr,
                    "Headache".tr,
                  ]),
                  SizedBox(height: 20),
                  Text(
                    "🚨 What to do in case of High Blood Sugar:".tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildInstructionList([
                    "1. Administer insulin as prescribed.".tr,
                    "2. Drink water to stay hydrated.".tr,
                    "3. Avoid carbohydrate-rich foods.".tr,
                    "4. Monitor blood sugar closely.".tr,
                    "5. Seek medical attention if symptoms worsen.".tr,
                  ]),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange.shade600,
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 24,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        elevation: 5,
                      ),
                      child: Text(
                        'Go Back'.tr,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSymptomList(List<String> symptoms) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          symptoms.map((symptom) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.orange.shade400),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      symptom,
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }

  Widget _buildInstructionList(List<String> instructions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          instructions.map((instruction) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_right, color: Colors.orange.shade400),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      instruction,
                      style: TextStyle(fontSize: 18, color: Colors.black87),
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}
