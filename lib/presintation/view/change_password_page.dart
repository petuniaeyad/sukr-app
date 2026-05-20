import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:sukar/presintation/widgets/text_field.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController currentPasswordController =
      TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void updatePassword() {
    if (newPasswordController.text == confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Password updated successfully".tr)),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Passwords do not match".tr)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // مهم لمنع التداخل
      appBar: AppBar(
        title: Text('Change Password'.tr),
        backgroundColor: Color(0xFF5a5ea3),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Current Password'.tr,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            MainTextField(
              controller: currentPasswordController,
              hint: 'Enter current password'.tr,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              isBorder: true,
            ),
            SizedBox(height: 20),
            Text(
              'New Password'.tr,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            MainTextField(
              controller: newPasswordController,
              hint: 'Enter new password'.tr,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              isBorder: true,
            ),
            SizedBox(height: 20),
            Text(
              'Confirm New Password'.tr,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            MainTextField(
              controller: confirmPasswordController,
              hint: 'Confirm new password'.tr,
              textInputType: TextInputType.visiblePassword,
              obscureText: true,
              isBorder: true,
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: updatePassword,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5a5ea3),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Update Password'.tr,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
