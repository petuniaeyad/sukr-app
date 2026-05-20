import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class LowBloodSugarPage extends StatelessWidget {
  const LowBloodSugarPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.red.shade100, Colors.white],
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
                    "🩸 What is Low Blood Sugar?".tr,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Low blood sugar (hypoglycemia) occurs when blood sugar levels drop below the normal range (usually under 70 mg/dL)."
                            " This can happen for various reasons, such as taking too much insulin, skipping meals, or excessive exercise."
                        .tr,
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "⚠️ Symptoms:".tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildSymptomList([
                    "Shaking and trembling".tr,
                    "Sweating".tr,
                    "Dizziness or lightheadedness".tr,
                    "Intense hunger".tr,
                    "Fatigue or irritability".tr,
                  ]),
                  SizedBox(height: 20),
                  Text(
                    "🚨 What to do in case of Low Blood Sugar:".tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildInstructionList([
                    "1. Give 15 grams of fast-acting sugar (e.g., half a cup of juice, 1 tablespoon of honey, or 3-4 glucose tablets)."
                        .tr,
                    "2. Wait for 15 minutes and recheck the blood sugar.".tr,
                    "3. If blood sugar is still low, repeat the 15 grams of sugar."
                        .tr,
                    "4. After recovery, give a balanced meal with carbs and protein."
                        .tr,
                  ]),
                  SizedBox(height: 20),
                  Text(
                    "📞 If the person is unconscious, **do not give anything to eat or drink**, and immediately call emergency services."
                        .tr,
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade600,
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
          symptoms
              .map(
                (symptom) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.check_circle, color: Colors.red.shade400),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          symptom,
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildInstructionList(List<String> instructions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          instructions
              .map(
                (instruction) => Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Icon(Icons.arrow_right, color: Colors.red.shade400),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          instruction,
                          style: TextStyle(fontSize: 18, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
    );
  }
}
