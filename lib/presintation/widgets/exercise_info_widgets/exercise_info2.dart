import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/controller/parents_controller.dart';
import 'package:sukar/presintation/widgets/text/headline3.dart';
import 'package:sukar/utils/constant.dart';

class ExerciseInfo2 extends StatelessWidget {
   ExerciseInfo2({
    super.key,
    required this.controller,
    required this.title,
  });
  ParentsController parentsController = ParentsController();
  final TextEditingController controller;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            width: width(context),
            height: 90,
            decoration: BoxDecoration(
              color: Color(0xFFEDB5D3),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Headline3(title: title, fontSize: 18),
          ),
          Positioned(
            left: 83,
            right: 83,
            bottom: 7,
            child: SizedBox(
              height: 50,
              child: Container(
                alignment: Alignment.center,
                width: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Obx(
                    () => DropdownButton(
                      isExpanded: true,
                      menuWidth: 180,
                      icon: Icon(Icons.keyboard_arrow_down_rounded),
                      onChanged: (value) {
                        parentsController.dropDownLabel.value = value.toString();
                        switch(parentsController.dropDownLabel.value){
                          case '3.5':
                            parentsController.activityImpactFactor = 0.8;
                            break;
                          case '7.5':
                            parentsController.activityImpactFactor = 1.0;
                            break;
                            case '10':
                            parentsController.activityImpactFactor = 1.2;
                            break;
                        }
                        log(value.toString());
                      },
                      value:parentsController.dropDownLabel.value,
                      items: [
                        DropdownMenuItem(
                          value: "3.5",
                          child: Text("Light walking".tr),
                        ),
                        DropdownMenuItem(
                          value: "7.5",
                          child: Text("Average running".tr),
                        ),
                        DropdownMenuItem(
                          value: "10",
                          child: Text("High intensity exercises".tr),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
