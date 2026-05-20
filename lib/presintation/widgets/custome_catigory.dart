import 'package:flutter/material.dart';
import 'package:sukar/helper/theme/app_colors.dart';
import 'package:sukar/presintation/widgets/text/body_text1.dart';

class CustomeCatigory extends StatelessWidget {
  const CustomeCatigory({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
  });
  final void Function()? onTap;
  final ImageProvider<Object> image;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: MediaQuery.sizeOf(context).height * .11,
            width: MediaQuery.sizeOf(context).width * .21,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: AppColors.white,
              image: DecorationImage(image: image),
            ),
          ),
        ),
        Wrap(
          direction: Axis.vertical,
          children: [
            BodyText1(
              title: title,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ],
    );
  }
}
