import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/controller/parents_controller.dart';
import 'package:sukar/presintation/widgets/text_field.dart';
import 'package:sukar/utils/app_general.dart';
import 'package:sukar/utils/routes/routes_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ParentsController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.grey.shade50,
          drawer: buildCustomDrawer(context),
          body: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 12.0,
                  ),
                  child: Row(
                    children: [
                      Builder(
                        builder:
                            (context) => IconButton(
                              icon: Icon(Icons.menu, size: 28),
                              onPressed:
                                  () => Scaffold.of(context).openDrawer(),
                            ),
                      ),
                      Text(
                        'app_name'.tr,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w800,
                          color: const Color(0xFF5a5ea3),
                        ),
                      ),
                      Spacer(),
                      _roundedIconButton(
                        '0 u |',
                        FontAwesomeIcons.syringe,
                        Color(0xFFB8B9BB),
                      ),
                      SizedBox(width: 8),
                      _roundedIconButton(
                        '0 g |',
                        FontAwesomeIcons.utensils,
                        Color(0xFF5A5EA3),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Expanded(
                        child:
                            AppGeneral.loginModel?.userType! == "Parents"
                                ? Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 6,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Text(
                                    "child_nickname".tr,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                )
                                : MainTextField(
                                  controller: controller.searchChild,
                                  hint: "Enter your child's national number".tr,
                                  textInputType: TextInputType.number,
                                  onFieldSubmitted: (p0) async {
                                    await controller.searchChildWithParentId(
                                      p0,
                                    );
                                  },
                                ),
                      ),
                      SizedBox(width: 12),
                      Hero(
                        tag: 'childAvatar',
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: const Color(0xFF5a5ea3),
                          child: Icon(
                            Icons.person,
                            size: 36,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.indigo.shade50,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    padding: EdgeInsets.all(20),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        int crossAxisCount = constraints.maxWidth < 400 ? 2 : 3;

                        return GridView.count(
                          crossAxisCount: crossAxisCount,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          children: [
                            GestureDetector(
                              onTap:
                                  () =>
                                      Get.toNamed(RoutesString.chatListScreen),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: _gridItem(Icons.chat, "chat".tr),
                              ),
                            ),
                            GestureDetector(
                              onTap:
                                  () => Get.toNamed(RoutesString.chatPotScreen),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: _gridItem(Icons.smart_toy, "chatbot".tr),
                              ),
                            ),
                            InkWell(
                              onTap:
                                  () => Get.toNamed(
                                    RoutesString.medicationmanagementpage,
                                  ),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: _gridItem(
                                  Icons.medication,
                                  "medications".tr,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap:
                                  () => Get.toNamed(RoutesString.exercisePage),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: _gridItem(
                                  Icons.directions_run,
                                  "exercise".tr,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap:
                                  () => Get.toNamed(
                                    RoutesString.mealmanagementpage,
                                  ),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: _gridItem(Icons.restaurant, "meals".tr),
                              ),
                            ),
                            InkWell(
                              onTap:
                                  () => Get.toNamed(
                                    RoutesString.emergencyinstructionspage,
                                  ),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                                child: _gridItem(
                                  Icons.warning,
                                  "emergency_instructions".tr,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _roundedIconButton(String label, IconData icon, Color color) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Text(label, style: TextStyle(fontWeight: FontWeight.w600)),
          SizedBox(width: 6),
          Icon(icon, size: 20),
        ],
      ),
    );
  }

  Widget _gridItem(IconData icon, String label) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 4)),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 50, color: const Color(0xFF5a5ea3)),
            SizedBox(height: 12),
            Text(
              label,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Drawer buildCustomDrawer(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF5a5ea3), Color(0xFFa7a9e7)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _drawerHeader(),
            SizedBox(height: 20),
            _drawerItem(
              icon: Icons.settings,
              label: 'settings'.tr,
              onTap: () => Get.toNamed(RoutesString.settings),
            ),
            SizedBox(height: 20),
            _drawerItem(
              icon: Icons.face,
              label: 'child_profile'.tr,
              onTap: () => Get.toNamed(RoutesString.childpersonalprofilepage),
            ),
            Visibility(
              visible:
                  AppGeneral.loginModel?.userType == "Parents" ? true : false,
              child: SizedBox(height: 20),
            ),
            Visibility(
              visible:
                  AppGeneral.loginModel?.userType == "Parents" ? true : false,
              child: _drawerItem(
                icon: Icons.face,
                label: 'add_child'.tr,
                onTap: () => Get.toNamed(RoutesString.childInfo),
              ),
            ),
            SizedBox(height: 20),
            _drawerItem(
              icon: FontAwesomeIcons.syringe,
              label: 'Add a dose of insulin'.tr,
              onTap: () => Get.toNamed(RoutesString.addDoseOfInsulinPage),
            ),
            SizedBox(height: 20),
            _drawerItem(
              icon: Icons.logout,
              label: 'logout'.tr,
              onTap: () {
                FirebaseAuth.instance.signOut();
                Get.offAllNamed(RoutesString.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _drawerHeader() {
  return Container(
    height: 180,
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Color(0xFF5a5ea3),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
    ),
    child: Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.white,
          child: Icon(Icons.person, size: 50, color: Color(0xFF5a5ea3)),
        ),
        SizedBox(height: 12),
        Text(
          "welcome_user".tr,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

Widget _drawerItem({
  required IconData icon,
  required String label,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Icon(icon, size: 30, color: Color(0xFF5a5ea3)),
        ],
      ),
    ),
  );
}
