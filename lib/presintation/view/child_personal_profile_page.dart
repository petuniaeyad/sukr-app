import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/controller/parents_controller.dart';

class ChildPersonalProfilePage extends StatelessWidget {
  const ChildPersonalProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ParentsController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Child's Personal Profile".tr),
            backgroundColor: Color(0xFF5a5ea3),
          ),
          body:
              controller.children.isEmpty
                  ? Center(child: Text("No Children Added"))
                  : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: controller.children.length,
                    itemBuilder: (context, index) {
                      final child = controller.children[index].childData!;
                      return Card(
                        color: Color(0xFF5A5EA3),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 6,
                        margin: const EdgeInsets.only(bottom: 16),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.child_care,
                                  size: 30,
                                  color: Color(0xFF5A5EA3),
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      child.childName ?? 'Unknown',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    _buildInfoRow("Age", child.age),
                                    _buildInfoRow(
                                      "National Number",
                                      child.nationalNumber,
                                    ),
                                    _buildInfoRow("Gender", child.gender),
                                    _buildInfoRow(
                                      "Diabetes Type",
                                      child.typeOfDiabetes,
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                color: Colors.white70,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
        );
      },
    );
  }
}

Widget _buildInfoRow(String label, String? value) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2),
    child: Text(
      "$label: ${value ?? 'N/A'}",
      style: TextStyle(color: Colors.white70, fontSize: 14),
    ),
  );
}
