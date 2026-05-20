import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Privacy Policy".tr),
        backgroundColor: const Color(0xFF5a5ea3),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5a5ea3), Colors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Privacy Matters".tr,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "We are committed to protecting your privacy. This Privacy Policy outlines how we collect, use, and safeguard your information."
                    .tr,
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 24),
              _buildSectionTitle("1. Information Collection".tr),
              _buildSectionContent(
                "We collect data you provide, such as your name, email, and health information, to improve your experience."
                    .tr,
              ),
              const SizedBox(height: 16),
              _buildSectionTitle("2. How We Use Your Data".tr),
              _buildSectionContent(
                "Your data is used solely for enhancing the features of the app, ensuring personalized content and support."
                    .tr,
              ),
              const SizedBox(height: 16),
              _buildSectionTitle("3. Data Protection".tr),
              _buildSectionContent(
                "We implement strict security measures to ensure the safety of your personal data."
                    .tr,
              ),
              const SizedBox(height: 16),
              _buildSectionTitle("4. Your Consent".tr),
              _buildSectionContent(
                "By using our app, you consent to this Privacy Policy.".tr,
              ),
              const SizedBox(height: 16),
              _buildSectionTitle("5. Changes to Policy".tr),
              _buildSectionContent(
                "We may update this policy periodically. Please review it regularly for changes."
                    .tr,
              ),
              const SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5a5ea3),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text("Back".tr),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  Widget _buildSectionContent(String content) {
    return Text(
      content,
      style: TextStyle(fontSize: 15, color: Colors.black87, height: 1.5),
    );
  }
}
