// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sukar/presintation/widgets/text/headline3.dart';
import 'package:sukar/presintation/widgets/text_field.dart';
import 'package:sukar/utils/constant.dart';

class ExerciseInfo extends StatelessWidget {
  ExerciseInfo({
    super.key,
    required this.controller,
    required this.title,
    this.visible,
  });

  final TextEditingController controller;
  final String title;
  final bool? visible;
  RxString? dropDownLabel = "Min".obs;
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
              child: Row(
                children: [
                  Flexible(
                    child: MainTextField(
                      isBorder: true,
                      borderColor: Colors.black,
                      borderWidth: 1.5,
                      controller: controller,
                      hint: "",
                      textInputType: TextInputType.number,
                    ),
                  ),
                  SizedBox(width: 5),
                  Visibility(
                    visible: visible ?? false,
                    child: Container(
                      alignment: Alignment.center,
                      width: 90,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black, width: 1.5),
                      ),
                      child: Obx(
                        () => DropdownButton(
                          menuWidth: 100,
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          onChanged: (value) {
                            dropDownLabel?.value = value.toString();
                          },
                          value: dropDownLabel!.value,
                          items: [
                            DropdownMenuItem(
                              value: "Min",
                              child: Text("Minutes".tr),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
