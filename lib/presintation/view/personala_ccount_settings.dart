import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/widgets/text_field.dart';
import 'package:sukar/utils/routes/routes_string.dart';

class PersonalAccountSettingsPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  PersonalAccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Account Settings'.tr),
        backgroundColor: Color(0xFF5a5ea3),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child: GestureDetector(
                onTap: () {},
                child: CircleAvatar(
                  radius: 50,
                  backgroundColor: Color(0xFF5a5ea3),
                  child: Icon(Icons.person, size: 60, color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),

            Text(
              'Full Name'.tr,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            MainTextField(
              controller: nameController,
              hint: 'Enter your full name'.tr,
              textInputType: TextInputType.name,
              onFieldSubmitted: (_) {},
              isBorder: true,
            ),
            SizedBox(height: 20),

            Text(
              'Email Address'.tr,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            MainTextField(
              controller: emailController,
              hint: 'Enter your email address'.tr,
              textInputType: TextInputType.emailAddress,
              onFieldSubmitted: (_) {},
              isBorder: true,
            ),
            SizedBox(height: 20),

            Text(
              'Phone Number'.tr,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            MainTextField(
              controller: phoneController,
              hint: 'Enter your phone number'.tr,
              textInputType: TextInputType.phone,
              onFieldSubmitted: (_) {},
              isBorder: true,
            ),
            SizedBox(height: 20),

            ListTile(
              leading: Icon(Icons.lock, color: Color(0xFF5a5ea3)),
              title: Text('Change Password'.tr),
              subtitle: Text('Update your account password'.tr),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed(RoutesString.changePassword);
              },
            ),
            Divider(),

            ListTile(
              leading: Icon(Icons.delete_forever, color: Colors.red),
              title: Text('Deactivate Account'.tr),
              subtitle: Text('Temporarily deactivate your account'.tr),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Get.toNamed(RoutesString.deactivateAccount);
              },
            ),

            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5a5ea3),
                  textStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Save Changes'.tr,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
