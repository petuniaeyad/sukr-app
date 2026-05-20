import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class RequestHelpPage extends StatelessWidget {
  const RequestHelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue.shade100, Colors.white],
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
                    "📞 Requesting Help in Emergencies".tr,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Knowing when and how to request help during a medical emergency can save lives. Whether it's contacting emergency services or notifying someone nearby, it's important to act quickly and clearly.".tr,
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "🆘 When to Call for Help:".tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildSymptomList([
                    "Loss of consciousness".tr,
                    "Severe difficulty breathing".tr,
                    "Uncontrollable bleeding".tr,
                    "Seizures or convulsions".tr,
                    "Confusion or disorientation".tr,
                  ]),
                  SizedBox(height: 20),
                  Text(
                    "📲 How to Request Help:".tr,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue.shade700,
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildInstructionList([
                    "1. Dial the local emergency number (e.g., 911).".tr,
                    "2. Clearly state your location and the nature of the emergency.".tr,
                    "3. Stay on the line until help arrives or the operator says you can hang up.".tr,
                    "4. If possible, alert others nearby for assistance.".tr,
                  ]),
                  SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade600,
                        padding:
                            EdgeInsets.symmetric(vertical: 12, horizontal: 24),
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
      children: symptoms.map((symptom) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.blue.shade400),
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
      children: instructions.map((instruction) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            children: [
              Icon(Icons.arrow_right, color: Colors.blue.shade400),
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
