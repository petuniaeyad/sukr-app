import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class LossOfConsciousnessPage extends StatelessWidget {
  const LossOfConsciousnessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.purple.shade100, Colors.white],
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
                    "🧠 What is Loss of Consciousness?".tr,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Loss of consciousness occurs when a person is unable to respond to people or activities. It can be caused by low blood sugar, head trauma, or other medical emergencies."
                        .tr,
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "⚠️ Signs and Symptoms:".tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildSymptomList([
                    "No response to voice or touch".tr,
                    "Slow or irregular breathing".tr,
                    "Pale or bluish skin".tr,
                    "Weak or no pulse".tr,
                  ]),
                  SizedBox(height: 20),
                  Text(
                    "🚨 What to do in this situation:".tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildInstructionList([
                    "1. Check for breathing and pulse.".tr,
                    "2. Call emergency services immediately.".tr,
                    "3. If trained, begin CPR if no pulse is found.".tr,
                    "4. If the person is breathing, place them in the recovery position."
                        .tr,
                  ]),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple.shade600,
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
                  Icon(Icons.check_circle, color: Colors.purple.shade400),
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
                  Icon(Icons.arrow_right, color: Colors.purple.shade400),
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
