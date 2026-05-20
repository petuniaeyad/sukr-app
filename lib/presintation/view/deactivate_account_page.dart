import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';

class DeactivateAccountPage extends StatelessWidget {
  const DeactivateAccountPage({super.key});

  void _showDeactivationConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Are you sure?".tr),
            content: Text("Your account will be temporarily deactivated.".tr),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel".tr),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Account deactivated".tr)),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                child: Text("Deactivate".tr),
              ),
            ],
          ),
    );
  }

  void _showReactivationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text("Reactivate Account".tr),
            content: Text("Do you want to reactivate your account?".tr),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel".tr),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Account reactivated".tr)),
                  );
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                child: Text("Reactivate".tr),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Deactivate Account'.tr),
        backgroundColor: Color(0xFF5a5ea3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.warning_amber_rounded, size: 60, color: Colors.red),
            SizedBox(height: 16),
            Text(
              'Are you sure you want to deactivate your account?'.tr,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 12),
            Text(
              'This will temporarily disable your account and you won\'t be able to access any features until you reactivate it.'
                  .tr,
              style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => _showDeactivationConfirmationDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text('Deactivate Account'.tr),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () => _showReactivationDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text('Reactivate Account'.tr),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
