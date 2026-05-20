import 'package:flutter/material.dart';
import 'package:sukar/presintation/widgets/text/body_text2.dart';
import 'package:sukar/presintation/widgets/text/headline3.dart';
import 'package:sukar/utils/constant.dart';

class ExerciseInfo3 extends StatelessWidget {
  const ExerciseInfo3({
    super.key,
    
    required this.title,
    this.visible,
    required this.result,
  });


  final String title;
  final bool? visible;
  final double result;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: width(context),
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFFEDB5D3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Headline3(title: title, fontSize: 18, maxLines: 2),
          Container(
            alignment: Alignment.center,
            width: 100,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black, width: 1.5),
              color: Colors.white,
            ),
            child: BodyText2(title: "$result"),
          ),
        ],
      ),
    );
  }
}
